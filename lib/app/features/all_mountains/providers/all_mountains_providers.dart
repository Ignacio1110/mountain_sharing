import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/all_mountains_model.dart';
import '../repository/all_mountains_repository_impl.dart';

final allPostProvider = StateNotifierProvider.autoDispose<AllPostNotifier,
    AsyncValue<List<PostModel>>>((ref) {
  return AllPostNotifier(ref);
});

class AllPostNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  AllPostNotifier(this.ref) : super(const AsyncData([])){
    refresh();
  }

  final Ref ref;

  Future<void> refresh() async {
    // Counter can use the "ref" to read other providers
    state = const AsyncLoading();
    final repository = ref.read(allMountainsRepositoryProvider);
    state = await AsyncValue.guard(repository.getPosts);
  }
}


final firstLoading =StateProvider.autoDispose<bool>((ref) => true);