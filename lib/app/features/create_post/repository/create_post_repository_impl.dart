import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../all_mountains/model/all_mountains_model.dart';
import 'create_post_repository.dart';

class CreatePostRepositoryImpl extends CreatePostRepository {
  /// 建立貼文
  @override
  Future createPost(
    String title,
    String content,
    List<String> tags,
    Uint8List img,
  ) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    // 未登入
    if (uid == null) return;

    // 上傳圖片
    if (img.isEmpty) return;

    // img 如果裁切後
    late ui.Image image;

    ui.decodeImageFromList(img, (result) {
      image = result;
    });

    final storageRef =
        FirebaseStorage.instance.ref('posts/${DateTime.now().toString()}.jpg');

    await storageRef.putData(
      img,
      SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {},
      ),
    );

    final imageUrl = await storageRef.getDownloadURL();

    final docReference = FirebaseFirestore.instance.collection('posts').doc();
    final data = {
      'id': docReference.id,
      'authorId': uid,
      'title': title,
      'content': content,
      'img': imageUrl,
      'tags': tags,
      'views': 0,
      'likes': 0,
      'comments': 0,
      'createdAt': DateTime.now(),
    };
    await docReference.set(data);

    return PostModel.fromJson(data);
  }
}

final createPostRepositoryProvider = Provider<CreatePostRepository>((ref) {
  return CreatePostRepositoryImpl();
});
