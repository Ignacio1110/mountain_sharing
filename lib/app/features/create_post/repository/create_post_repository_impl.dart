import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_mountains/model/all_mountains_model.dart';
import 'create_post_repository.dart';

class CreatePostRepositoryImpl extends CreatePostRepository {
  /// 建立貼文
  @override
  Future createPost(
    String title,
    String content,
    List<String> tags,
    String img,
  ) async {
    if (FirebaseAuth.instance.currentUser?.uid case final String uid) {
      final docReference = FirebaseFirestore.instance.collection('posts').doc();
      final data = {
        'postId': docReference.id,
        'authorId': uid,
        'title': title,
        'content': content,
        'img': img,
        'tags': tags,
        'views': 0,
        'likes': 0,
        'comments': 0,
      };
      await docReference.set(data);

      return PostModel.fromJson(data);
    }
  }
}

final createPostRepositoryProvider = Provider<CreatePostRepository>((ref) {
  return CreatePostRepositoryImpl();
});
