
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/data&model/product_list_model.dart';
import '../../../common/data&model/product_model.dart';

class ProductListByRemarkController extends GetxController {
  bool _popularProductInProgress = false;
  bool _specialProductInProgress = false;
  bool _newProductInProgress = false;

  bool get popularProductInProgress => _popularProductInProgress;

  bool get specialProductInProgress => _specialProductInProgress;

  bool get newProductInProgress => _newProductInProgress;

  ProductListModel? _popularProductListModel;
  ProductListModel? _specialProductListModel;
  ProductListModel? _newProductListModel;

  List<ProductModel> get popularProductList =>
      _popularProductListModel?.productList ?? [];

  List<ProductModel> get specialProductList =>
      _specialProductListModel?.productList ?? [];

  List<ProductModel> get newProductList =>
      _newProductListModel?.productList ?? [];

  String? _popularErrorMessage;
  String? _specialErrorMessage;
  String? _newErrorMessage;

  String? get popularErrorMessage => _popularErrorMessage;

  String? get specialErrorMessage => _specialErrorMessage;

  String? get newErrorMessage => _newErrorMessage;

  Future<bool> getProductListByRemark(String remark) async {
    bool isSuccess = false;
    if (remark == 'popular') {
      _popularProductInProgress = true;
    } else if (remark == 'special') {
      _specialProductInProgress = true;
    } else {
      _newProductInProgress = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.productListByRemarkUrl(remark));
    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularProductListModel =
            ProductListModel.fromJson(response.responseData);
      } else if (remark == 'special') {
        _specialProductListModel =
            ProductListModel.fromJson(response.responseData);
      } else {
        _newProductListModel = ProductListModel.fromJson(response.responseData);
      }
      isSuccess = true;
    } else {
      if (remark == 'popular') {
        _popularErrorMessage = response.errorMessage;
      } else if (remark == 'special') {
        _specialErrorMessage = response.errorMessage;
      } else {
        _newErrorMessage = response.errorMessage;
      }
    }
    if (remark == 'popular') {
      _popularProductInProgress = false;
    } else if (remark == 'special') {
      _specialProductInProgress = false;
    } else {
      _newProductInProgress = false;
    }
    update();
    return isSuccess;
  }
}