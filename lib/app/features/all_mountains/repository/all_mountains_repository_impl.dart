import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'all_mountains_repository.dart';

class AllMountainsRepositoryImpl extends AllMountainsRepository {
  // TODO add your methods here
}

final allMountainsRepositoryProvider = Provider<AllMountainsRepository>((ref) {
  return AllMountainsRepositoryImpl();
});
