import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/features/all_mountains/widget/all_mountains_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/all_mountains_model.dart';
import '../providers/all_mountains_providers.dart';

class AllMountainsView extends ConsumerWidget {
  /// TODO add your comment here
  const AllMountainsView({Key? key}) : super(key: key);

  static const routeName = '/allMountains';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MountainPostModel> postData = ref.watch(allPostProvider);
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Text('台灣山岳'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: postData.length,
          separatorBuilder: (BuildContext ctx, int index) {
            return const SizedBox(
              height: 16.0,
            );
          },
          itemBuilder: (BuildContext ctx, int index) {
            return ItemMountainWidget(
              postData: postData[index],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(allPostProvider.notifier).refresh();
        },
      ),
    );
  }
}
