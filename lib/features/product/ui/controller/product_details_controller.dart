import 'package:get/get.dart';
import 'package:rasel_shop/features/product/Data/models/product_details_model.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';
import '../../../../app/urls.dart';

class ProductDetailsController extends GetxController {
  // Private variables for managing state
  bool _inProgress = false;
  ProductDetailsModel? _productDetailsModel;
  String? _errorMessage;

  // Public getters for accessing state
  bool get inProgress => _inProgress;
  ProductDetails? get productDetails => _productDetailsModel?.data!.first;
  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    _inProgress = true; // Start loading
    update(); // Notify UI

    // Make network request
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.productDetaitls(productId));

    if (response.isSuccess) {
      // Parse response data
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.responsedata);
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
