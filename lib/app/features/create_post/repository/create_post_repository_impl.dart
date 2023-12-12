import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'create_post_repository.dart';

class CreatePostRepositoryImpl extends CreatePostRepository {
  // TODO add your methods here
}

final createPostRepositoryProvider = Provider<CreatePostRepository>((ref) {
  return CreatePostRepositoryImpl();
});
