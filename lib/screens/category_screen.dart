import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

import '../services/api_handler.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: FutureBuilder<List<CategoryModel>>(
            future: APIHandler.getAppCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('An Error occurred ${snapshot.error}'),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text('No Products Found'),
                );
              }
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 1.2),
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: const CategoryWidget());
                  });
            }));
  }
}
