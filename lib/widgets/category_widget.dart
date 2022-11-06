import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import '../models/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, this.categoryModel}) : super(key: key);
  final CategoryModel? categoryModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.height * 0.45,
              width: size.height * 0.45,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: categoryModel!.image.toString(),
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              categoryModel!.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  backgroundColor: lightCardColor.withOpacity(0.5),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
