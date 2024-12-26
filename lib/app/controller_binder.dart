import 'package:get/get.dart';
import 'package:rasel_shop/features/common/ui/controllers/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
