import '../model/all_mountains_model.dart';
import 'all_mountains_repository.dart';

class AllMountainsRepositoryFake extends AllMountainsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    return [PostModel.fromJson(sample)];
  }

  @override
  Future<List<PostModel>> fetchPosts(PostModel last)async{
    return [PostModel.fromJson(sample)];
  }
}
