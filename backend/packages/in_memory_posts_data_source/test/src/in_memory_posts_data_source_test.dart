// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:in_memory_posts_data_source/in_memory_posts_data_source.dart';

void main() {
  group('InMemoryPostsDataSource', () {
    test('can be instantiated', () {
      expect(InMemoryPostsDataSource(), isNotNull);
    });
  });
}
