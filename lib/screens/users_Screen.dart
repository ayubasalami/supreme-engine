import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_api_flutter_course/widgets/users-widget.dart';
import '../prodivers/data_provider.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userScreen);
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('Users'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _data.when(
                data: (_data) {
                  List users = _data.map((e) => e).toList();
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (_, index) {
                          return UsersWidget(
                            usersModel: users[index],
                          );
                        },
                      )
                    ],
                  );
                },
                error: (err, r) => Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text('Error:$err')),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))
          ],
        ),
      ),
    );
  }
}
