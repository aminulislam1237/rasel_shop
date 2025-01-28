class CategoryModel {
  int id;
  String? categoryName;
  String? categoryImg;
  String? createdAt;
  String? updatedAt;

  CategoryModel({
    required this.id,
    this.categoryName,
    this.categoryImg,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] != null ? json['id'] as int : 0,
      categoryName: json['categoryName'],
      categoryImg: json['categoryImg'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'categoryImg': categoryImg,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
