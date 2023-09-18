import 'package:posts_data_source/posts_data_source.dart';
import 'dart:io';
import 'dart:convert';

/// {@template in_memory_posts_data_source}
/// An in-memory implementation of the TodosDataSource interface.
/// {@endtemplate}
class InMemoryPostsDataSource implements PostsDataSource {
  ///
  InMemoryPostsDataSource() {
    _init();
  }

  Future<void> _init() async {
    final jsonString = File(
            '/Users/ignacio/Documents/Ignacio/mountain_sharing/backend/packages/in_memory_posts_data_source/lib/src/posts.json')
        .readAsStringSync();
    final map = jsonDecode(jsonString);
    for (final e in map['posts'] as List) {
      final postModel = PostModel.fromJson(e as Map<String, dynamic>);
      _cache[postModel.id] = postModel;
    }
  }

  /// Map of ID -> Todo
  final _cache = <String, PostModel>{};

  @override
  Future<PostModel> create(PostModel todo) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PostModel?> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> readAll() async {
    return _cache.values.toList();
  }

  @override
  Future<PostModel> update(String id, PostModel todo) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
