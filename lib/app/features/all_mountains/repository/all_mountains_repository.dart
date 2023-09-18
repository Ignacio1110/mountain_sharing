import '../model/all_mountains_model.dart';

abstract class AllMountainsRepository {
  Future<List<PostModel>> getPosts();
}
