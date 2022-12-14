import 'dart:convert';
import 'dart:developer';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/products_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({
    required String target,
    String? limit,
  }) async {
    try {
      var uri = Uri.https(BASE_URL, 'api/v1/$target',
          target == 'products' ? {'offset': '0', 'limit': limit} : {});

      var response = await http.get(uri);

      var data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        throw data['message'];
      }
      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (error) {
      log('An error occurred $error');
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getAppProducts(
      {required String limit}) async {
    List temp = await getData(target: 'products', limit: limit);
    return ProductsModel.productsFromSnapshot(temp);
  }

  Future<List<CategoryModel>> getAppCategories() async {
    List temp = await getData(target: 'categories');
    return CategoryModel.categoryFromSnapshot(temp);
  }

  Future<List<UsersModel>> getAppUsers() async {
    List temp = await getData(target: 'users');
    return UsersModel.usersFromSnapshot(temp);
  }

  static Future<ProductsModel> getProductById({
    required String id,
  }) async {
    try {
      var uri = Uri.https(BASE_URL, 'api/v1/products/$id');

      var response = await http.get(uri);

      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }

      return ProductsModel.fromJson(data);
    } catch (error) {
      log('An error occurred while getting products info: $error');
      throw error.toString();
    }
  }
}

final userProvider = Provider<APIHandler>((ref) => APIHandler());
