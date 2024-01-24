import 'dart:typed_data';

import 'create_post_repository.dart';

class CreatePostRepositoryFake extends CreatePostRepository {
  /// 建立貼文
  @override
  Future createPost(
    String title,
    String content,
    List<String> tags,
    Uint8List img,
  ) async {}
}
