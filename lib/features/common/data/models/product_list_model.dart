import 'package:rasel_shop/features/common/data/models/product_model.dart';

class ProductListModel {
  String? msg;
  List<product_model>? productList;

  ProductListModel({this.msg, this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <product_model>[];
      json['data'].forEach((v) {
        productList!.add(product_model.fromJson(v));
      });
    }
  }
}
