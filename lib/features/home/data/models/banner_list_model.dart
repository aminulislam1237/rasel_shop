import 'package:rasel_shop/features/home/data/models/banner_model.dart';

class BannerListModel {
  String? msg;
  List<BannerModel>? data;

  BannerListModel({this.msg, this.data});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <BannerModel>[];
      json['data'].forEach((v) {
        data!.add( BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

