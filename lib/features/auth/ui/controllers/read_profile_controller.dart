import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rasel_shop/features/auth/ui/data/models/profile_model.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';

import '../../../../app/urls.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;


  Future<bool> readProfileData(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.readProfile,accessToken: token,);

    if (response.isSuccess) {
      _errorMessage = null;
      if(response.responsedata['data']== null){
        _profileModel = null;
      }else{
        _profileModel = ProfileModel.fromJson(response.responsedata['data']);

      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
