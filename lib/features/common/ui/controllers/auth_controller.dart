import 'dart:convert';

import 'package:rasel_shop/features/auth/ui/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontroller{
  final String _accessTokenkey ='access-token';
  final String _profileDataKey ='access-token';
  String? accessToken;
  ProfileModel?profileModel;


Future<void> saveUserData(String accessToken,ProfileModel model) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(_accessTokenkey, accessToken);
  await sharedPreferences.setString(_profileDataKey,jsonEncode(model.toJson()));

}
  Future<void> getUserdata() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken= sharedPreferences.getString(_accessTokenkey);
    profileModel= ProfileModel.fromJson(jsonDecode(sharedPreferences.getString(_profileDataKey)!));

  }
Future<bool> isUserLoggedIn(String accessToken)async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString(_accessTokenkey);
  if(token!=null){
    await getUserdata();

    return true;
  }
  return false;
}
Future<void> clearData()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.remove(_accessTokenkey);
  await sharedPreferences.remove(_profileDataKey);
}

}