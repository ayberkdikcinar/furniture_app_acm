import 'package:furniture_app/core/base/base_model.dart';

class Product extends BaseModel {
  String? id;
  String? title;
  String? image;
  double? price;
  double? point;
  String? categoryId;
  String? description;

  Product({this.id, this.title, this.image, this.price, this.point, this.categoryId, this.description});

  @override
  Product fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    point = json['point'];
    description = json['description'];
    categoryId = json['categoryId'];
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['point'] = point;
    data['description'] = description;
    data['categoryId'] = categoryId;
    return data;
  }
}
