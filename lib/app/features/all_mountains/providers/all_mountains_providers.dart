import 'package:flutter_application_1/app/features/all_mountains/model/all_mountains_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/all_mountains_repository_impl.dart';
//
// final allPostProvider = Provider<List<MountainPostModel>>((ref) {
//   return [
//     MountainPostModel.sample(666),
//     MountainPostModel.sample(667),
//   ];
// });

final allPostProvider =
    StateNotifierProvider<AllPostNotifier, List<MountainPostModel>>((ref) {
  return AllPostNotifier(ref);
});

class AllPostNotifier extends StateNotifier<List<MountainPostModel>> {
  AllPostNotifier(this.ref) : super([]);

  final Ref ref;

  void refresh() async {
    // Counter can use the "ref" to read other providers
    final repository = ref.read(allMountainsRepositoryProvider);
    List<MountainPostModel> newData = await repository.getPosts();
    state = newData;
  }
}
