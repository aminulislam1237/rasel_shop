import 'package:get/get.dart';
import 'package:rasel_shop/features/home/data/models/banner_list_model.dart';
import 'package:rasel_shop/features/home/data/models/banner_model.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';
import '../../../../app/urls.dart';

class HomeBannerListController extends GetxController {
  // Private variables for managing state
  bool _inProgress = false;
  BannerListModel? _bannerListModel;
  String? _errorMessage;

  // Public getters for accessing state
  bool get inProgress => _inProgress;
  List<BannerModel> get bannerList => _bannerListModel?.data ?? [];
  String? get errorMessage => _errorMessage;

  // Method to fetch the banner list
  Future<bool> getHomeBannerList() async {
    _inProgress = true; // Start loading
    update(); // Notify UI

    // Make network request
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.bannerListUrl);

    if (response.isSuccess) {
      // Parse response data
      _bannerListModel = BannerListModel.fromJson(response.responsedata);
      _errorMessage = null; // Clear previous error message on success
      _inProgress = false; // Stop loading
      update(); // Notify UI
      return true; // Success
    } else {
      // Handle error
      _errorMessage = response.errorMessage; // Set error message
      _inProgress = false; // Stop loading
      update(); // Notify UI
      return false; // Failure
    }
  }
}
