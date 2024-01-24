import 'dart:typed_data';

abstract class CreatePostRepository {
  /// 建立貼文
  Future createPost(
    String title,
    String content,
    List<String> tags,
    Uint8List img,
  );
}
