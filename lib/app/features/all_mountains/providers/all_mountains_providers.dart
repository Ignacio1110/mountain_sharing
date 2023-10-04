import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/all_mountains_model.dart';
import '../repository/all_mountains_repository_impl.dart';

final allPostProvider = StateNotifierProvider.autoDispose<AllPostNotifier,
    AsyncValue<List<PostModel>>>((ref) {
  return AllPostNotifier(ref);
});

class AllPostNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  AllPostNotifier(this.ref) : super(const AsyncData([])) {
    refresh();
  }

  final Ref ref;

  Future<void> refresh() async {
    // Counter can use the "ref" to read other providers
    state = const AsyncLoading();
    final repository = ref.read(allMountainsRepositoryProvider);
    state = await AsyncValue.guard(repository.getPosts);
  }

  Future<void> loadMore() async {
    // Counter can use the "ref" to read other providers
    final repository = ref.read(allMountainsRepositoryProvider);
    if(ref.read(isLoadingMore.notifier).state ==true) return;
    try {
      if (state.value == null) return;

      final data = state.value!;
      ref.read(isLoadingMore.notifier).state = true;
      List<PostModel> newData = await repository.fetchPosts(data.last);

      data.addAll(newData);
      state = AsyncValue.data(data);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    } finally {
      ref.read(isLoadingMore.notifier).state = false;
    }
  }
}

final firstLoading = StateProvider.autoDispose<bool>((ref) => true);

final isLoadingMore = StateProvider.autoDispose<bool>((ref) => false);
