import '../model/all_mountains_model.dart';

abstract class AllMountainsRepository {
  //第一次取得資料
  Future<List<PostModel>> getPosts();
  Future<List<PostModel>> fetchPosts(PostModel last);
}
