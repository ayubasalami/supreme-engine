import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

import '../models/products_model.dart';

class FeedsGridWidget extends StatelessWidget {
  FeedsGridWidget({Key? key, required this.productsList}) : super(key: key);
  List<ProductsModel> productsList = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: productsList[index], child: const FeedsWidget());
        });
  }
}
