import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import '../models/products_model.dart';
import '../models/users_model.dart';

final userDataProvider = FutureProvider<List<ProductsModel>>((ref) async {
  return APIHandler.getAppProducts(limit: '4');
});
final userScreen = FutureProvider<List<UsersModel>>((ref) async {
  return ref.watch(userProvider).getAppUsers();
});
final categoryScreen = FutureProvider<List<CategoryModel>>((ref) async {
  return ref.watch(userProvider).getAppCategories();
});
