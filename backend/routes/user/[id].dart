import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:users_data_source/users_data_source.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, id);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

/// 從資料庫拿user
Future<Response> _get(RequestContext context, String id) async {
  final dataSource = context.read<UsersDataSource>();
  final user = await dataSource.read(id);
  return Response.json(body: user);
}
