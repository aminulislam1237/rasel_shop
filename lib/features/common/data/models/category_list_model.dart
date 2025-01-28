import 'category_model.dart';

class CategoryListModel {
  String? msg;
  List<CategoryModel>? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  factory CategoryListModel.fromJson(Map<String, dynamic> json) {
    return CategoryListModel(
      msg: json['msg'],
      categoryList: (json['data'] as List?)?.map((v) {
        return CategoryModel.fromJson(v as Map<String, dynamic>);
      }).toList() ?? [], // ✅ Ensure categoryList is never null
    );
  }


  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryList != null) {
      data['data'] = categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
