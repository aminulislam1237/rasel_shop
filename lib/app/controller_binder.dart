import 'package:get/get.dart';
import 'package:rasel_shop/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:rasel_shop/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:rasel_shop/features/common/ui/controllers/auth_controller.dart';
import 'package:rasel_shop/features/common/ui/controllers/category_list_controller.dart';
import 'package:rasel_shop/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:rasel_shop/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:rasel_shop/features/home/ui/controllers/product_list_controller.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';

import '../features/auth/ui/controllers/otp_verification_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
    Get.put(Authcontroller());
    Get.put(HomeBannerListController());
    Get.put(CategoryListController());
    Get.put(ProductListByRemarkController());
  }
}
