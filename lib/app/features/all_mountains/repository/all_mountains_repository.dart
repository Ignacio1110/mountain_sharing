import 'package:flutter_application_1/app/features/all_mountains/model/all_mountains_model.dart';

abstract class AllMountainsRepository {
  Future<List<MountainPostModel>> getPosts();
}
