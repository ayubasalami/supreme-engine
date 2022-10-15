import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';
import '../prodivers/data_provider.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(categoryScreen);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Column(
          children: [
            _data.when(
                data: (_data) {
                  List category = _data.map((e) => e).toList();
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 1.2),
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          categoryModel: category[index],
                        );
                      });
                },
                error: (err, f) => Text(err.toString()),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ],
        ));
  }
}
