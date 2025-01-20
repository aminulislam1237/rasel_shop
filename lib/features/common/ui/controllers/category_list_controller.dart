
import 'package:get/get.dart';
import 'package:rasel_shop/features/common/data/models/category_model.dart';
import 'package:rasel_shop/services/network_caller/network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/models/category_list_model.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  CategoryListModel? _categoryListModel;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  List<CategoryModel> get categoryList => _categoryListModel?.categoryList??[];


  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    _inProgress = true; // Start loading
    update(); // Notify UI

    // Make network request
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.categoryListUrl);

    if (response.isSuccess) {
      // Parse response data
      _categoryListModel = CategoryListModel.fromJson(response.responsedata);
      _errorMessage = null;
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
