import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../model/all_mountains_model.dart';
import '../providers/all_mountains_providers.dart';
import '../widget/all_mountains_widget.dart';

class AllMountainsView extends ConsumerWidget {
  /// TODO add your comment here
  const AllMountainsView({Key? key}) : super(key: key);

  static const routeName = '/allMountains';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDataAsync = ref.watch(allPostProvider);

    ref.listen<AsyncValue<List<PostModel>>>(allPostProvider, (previous, next) {
      if (next is AsyncError<List<PostModel>>) {
        logger.d('has error:${next.error}');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('error:${next} ',maxLines: 2,)));
      }
    });

    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: const Text('台灣山岳'),
      ),
      body: postDataAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error: $err'),
          data: (postData) => ListView.separated(
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
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(allPostProvider.notifier).refresh();
        },
      ),
    );
  }
}
