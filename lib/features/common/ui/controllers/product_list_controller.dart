
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../data&model/product_list_model.dart';
import '../../data&model/product_model.dart';

class ProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductListModel? _productListModel;

  List<ProductModel> get productList => _productListModel?.productList ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductListByCategory(int categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.productListByCategoryUrl(categoryId));
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}