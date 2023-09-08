import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_posts_data_source/in_memory_posts_data_source.dart';
import 'package:posts_data_source/posts_data_source.dart';

final _dataSource = InMemoryPostsDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<PostsDataSource>((_) => _dataSource));
}
