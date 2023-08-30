import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/all_mountains_model.dart';
import 'all_mountains_repository.dart';
import 'dart:math';

class AllMountainsRepositoryImpl extends AllMountainsRepository {
  @override
  Future<List<MountainPostModel>> getPosts() async {
    return [MountainPostModel.sample(Random().nextInt(100))];
  }
}

final allMountainsRepositoryProvider = Provider<AllMountainsRepository>((ref) {
  return AllMountainsRepositoryImpl();
});
