import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../model/all_mountains_model.dart';
import '../providers/all_mountains_providers.dart';
import '../widget/all_mountains_widget.dart';

class AllMountainsView extends ConsumerStatefulWidget {
  /// TODO add your comment here
  const AllMountainsView({Key? key}) : super(key: key);

  static const routeName = '/allMountains';

  @override
  ConsumerState<AllMountainsView> createState() =>
      _AllMountainsViewWidgetState();
}

// 2. extend [ConsumerState]
class _AllMountainsViewWidgetState extends ConsumerState<AllMountainsView> {
  ScrollController scrollController = ScrollController();

  scrollListener() {
    if (scrollController.offset > scrollController.position.maxScrollExtent) {
      //載入更多資料，並且更新postData
      ref.read(allPostProvider.notifier).loadMore();
    }
  }

  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postDataAsync = ref.watch(allPostProvider);

    ref.listen<AsyncValue<List<PostModel>>>(allPostProvider, (previous, next) {
      if (next is AsyncError<List<PostModel>>) {
        logger.d('has error:${next.error}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'error:${next} ',
          maxLines: 2,
        )));
      }
    });
    final bool firstLoadingState = ref.watch(firstLoading);
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: const Text('台灣山岳'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(firstLoading.notifier).state = false;
          await ref.read(allPostProvider.notifier).refresh();
        },
        color: Colors.yellow,
        child: postDataAsync.when(
          loading: () => firstLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox(
                  height: 100.0,
                  width: double.infinity,
                ),
          error: (err, stack) => Text('Error: $err'),
          data: (postData) => ListView.separated(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            itemCount: postData.length + 1,
            separatorBuilder: (BuildContext ctx, int index) {
              return const SizedBox(
                height: 16.0,
              );
            },
            itemBuilder: (BuildContext ctx, int index) {
              if (index == postData.length) {
                return Center(
                  child: ref.watch(isLoadingMore)
                      ? const Center(child: CircularProgressIndicator())
                      : GestureDetector(
                          onTap: () {
                            //載入更多資料，並且更新postData
                            ref.read(allPostProvider.notifier).loadMore();
                          },
                          child: const Text('載入更多')),
                );
              }
              return ItemMountainWidget(
                postData: postData[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
