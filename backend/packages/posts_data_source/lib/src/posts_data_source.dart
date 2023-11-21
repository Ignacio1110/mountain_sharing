import 'package:posts_data_source/posts_data_source.dart';

/// An interface for a todos data source.
/// A todos data source supports basic C.R.U.D operations.
/// * C - Create
/// * R - Read
/// * U - Update
/// * D - Delete
abstract class PostsDataSource {
  /// Create and return the newly created todo.
  Future<PostModel> create(PostModel todo);

  /// Return all todos.
  Future<List<PostModel>> readAll();

  /// Return a todo with the provided [id] if one exists.
  Future<PostModel?> read(String id);

  /// Update the todo with the provided [id] to match [todo] and
  /// return the updated todo.
  Future<PostModel> update(String id, PostModel todo);

  /// Delete the todo with the provided [id] if one exists.
  Future<void> delete(String id);
}
