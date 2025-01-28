import 'package:get/get.dart';
import 'package:rasel_shop/features/common/data/models/product_list_model.dart';
import 'package:rasel_shop/features/common/data/models/product_model.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';
import '../../../../app/urls.dart';

class PopularProductListController extends GetxController {
  bool _inProgress = false;
  ProductListModel? _productListModel;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  List<ProductModel> get productList => _productListModel?.productList ?? [];
  String? get errorMessage => _errorMessage;

  Future<bool> getProductList() async {
    _inProgress = true; // Start loading
    update(); // Notify UI

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.productLisbyRemarktUrl('Popular'));

    if (response.isSuccess) {
      // Parse response data
      _productListModel = ProductListModel.fromJson(response.responsedata);
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
