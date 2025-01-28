import 'package:get/get.dart';
import 'package:rasel_shop/features/common/data/models/product_list_model.dart';
import 'package:rasel_shop/features/common/data/models/product_model.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';
import '../../../../app/urls.dart';

class ProductListByRemarkController extends GetxController {
  bool _popularProductInProgress = false;
  bool _specialProductInProgress = false;
  bool _newProductInProgress = false;

  ProductListModel? _popularProductListModel;
  ProductListModel? _specialProductListModel;
  ProductListModel? _newProductListModel;

  bool get popularProductInProgress => _popularProductInProgress;
  bool get specialProductInProgress => _specialProductInProgress;
  bool get newProductInProgress => _newProductInProgress;

  List<ProductModel> get popularProductList =>
      _popularProductListModel?.productList ?? [];

  List<ProductModel> get specialProductList =>
      _specialProductListModel?.productList ?? [];

  List<ProductModel> get newProductList =>
      _newProductListModel?.productList ?? [];

  String? _populerErrorMessage;
  String? _specialErrorMessage;
  String? _newErrorMessage;

  String? get PopulerErrorMessage => _populerErrorMessage;
  String? get SpecialErrorMessage => _specialErrorMessage;
  String? get NewErrorMessage => _newErrorMessage;

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
        .getRequest(Urls.productLisbyRemarktUrl(remark));

    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularProductListModel =
            ProductListModel.fromJson(response.responsedata);
      } else if (remark == 'special') {
        _specialProductListModel =
            ProductListModel.fromJson(response.responsedata);
      } else {
        _newProductListModel = ProductListModel.fromJson(response.responsedata);
      }
      isSuccess = true;
      update(); // Notify UI
      return true; // Success
    } else {
      if (remark == 'popular') {
        _populerErrorMessage = response.errorMessage; // Set error message
      } else if (remark == 'special') {
        _specialErrorMessage = response.errorMessage; // Set error message
      } else {
        _newErrorMessage = response.errorMessage; // Set error message
      }
      if (remark == 'popular') {
        _popularProductInProgress = false;
      } else if (remark == 'special') {
        _specialProductInProgress = false;
      } else {
        _newProductInProgress = false;
      }
      update(); // Notify UI
      return isSuccess; // Failure
    }
  }
}
