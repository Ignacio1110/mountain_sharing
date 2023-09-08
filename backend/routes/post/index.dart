import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:posts_data_source/posts_data_source.dart';


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
  final todos = await dataSource.readAll();
  return Response.json(body: todos);
}