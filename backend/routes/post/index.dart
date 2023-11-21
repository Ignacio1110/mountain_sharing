import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mountain_models/mountain_models.dart';
import 'package:posts_data_source/posts_data_source.dart';
import 'package:users_data_source/users_data_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final dataSource = context.read<PostsDataSource>();
  final posts = await dataSource.readAll();
  final usersDataSource = context.read<UsersDataSource>();
  final postResponses = await Future.wait(
    posts.map((e) async {
      final user = await usersDataSource.read(e.authorId);
      final postResponseJson = e.toJson()..['userModel'] = user?.toJson();
      return PostResponse.fromJson(postResponseJson);
    }).toList(),
  );
  return Response.json(body: postResponses);
}
