
import 'package:get/get.dart';

import '../features/auth/ui/controllers/otp_verification_controller.dart';
import '../features/auth/ui/controllers/sign_in_controller.dart';
import '../features/auth/ui/controllers/sign_up_controller.dart';
import '../features/common/ui/controllers/auth_controller.dart';
import '../features/common/ui/controllers/category_list_controller.dart';
import '../features/common/ui/controllers/main_bottom_nav_controller.dart';
import '../features/common/ui/controllers/product_list_controller.dart';
import '../features/home/ui/controllers/Product_list_by_remark_controller.dart';
import '../features/home/ui/controllers/popular_product_list_controller.dart';
import '../features/home/ui/controllers/slider_list_controller.dart';
import '../features/product/ui/controller/product_details_controller.dart';
import '../services/network_caller/network_caller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(ProductListByRemarkController());
    Get.put(PopularProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
  }
}