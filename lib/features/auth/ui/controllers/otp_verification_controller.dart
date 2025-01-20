import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rasel_shop/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';

import '../../../../app/urls.dart';
import '../../../common/ui/controllers/auth_controller.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _shouldNavigateCompleteProfile = false;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String? _token;
  String? get token => _token;

  Future<bool> verifyotp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.verifiyOtplUrl(email, otp));

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token = response.responsedata['token'];
      await Get.find<ReadProfileController>().readProfileData(token);
      if (Get.find<ReadProfileController>().profileModel == null) {
        _shouldNavigateCompleteProfile = true;
      } else {
        await Get.find<Authcontroller>().saveUserData(
            token, Get.find<ReadProfileController>().profileModel!);
        _shouldNavigateCompleteProfile = false;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
