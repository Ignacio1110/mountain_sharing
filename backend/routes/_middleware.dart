import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_posts_data_source/in_memory_posts_data_source.dart';
import 'package:in_memory_users_data_source/in_memory_users_data_source.dart';
import 'package:posts_data_source/posts_data_source.dart';
import 'package:users_data_source/users_data_source.dart';

final _postDataSource = InMemoryPostsDataSource();
final _userDataSource = InMemoryUsersDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<PostsDataSource>((_) => _postDataSource))
      .use(provider<UsersDataSource>((_) => _userDataSource));
}
