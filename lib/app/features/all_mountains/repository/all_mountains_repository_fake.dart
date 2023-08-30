import '../model/all_mountains_model.dart';
import 'all_mountains_repository.dart';

class AllMountainsRepositoryFake extends AllMountainsRepository {
  @override
  Future<List<MountainPostModel>> getPosts() async {
    return [MountainPostModel.sample(999)];
  }
}
