import 'package:posts_data_source/posts_data_source.dart';

/// {@template in_memory_posts_data_source}
/// An in-memory implementation of the TodosDataSource interface.
/// {@endtemplate}
class InMemoryPostsDataSource implements PostsDataSource {
///
InMemoryPostsDataSource(){
  final postModel1 = PostModel.fromJson(const {
        "id": "1",
        "authorId": "user1",
        "mountainName":"mountain1",
        "title": "First Post",
        "content": "This is the content of the first post.",
        "img": "image1.jpg",
        "tags": [
            "tag1",
            "tag2"
        ],
        "views": 100,
        "likes": 50,
        "comments": 5
    });
    _cache[postModel1.id] =postModel1;
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
