import 'package:flutter/cupertino.dart';

import 'categories_model.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  CategoryModel? category;
  List<String>? images;
  int? categoryId;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images,
      this.categoryId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    categoryId = json['categoryId'];
  }
  static List<ProductsModel> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
