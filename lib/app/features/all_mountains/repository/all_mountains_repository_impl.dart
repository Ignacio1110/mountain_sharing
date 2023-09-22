import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/utils.dart';
import '../model/all_mountains_model.dart';
import 'all_mountains_repository.dart';
import 'package:dio/dio.dart';

class AllMountainsRepositoryImpl extends AllMountainsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    final Dio _dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
        responseType: ResponseType.json,
      ),
    );

    // http://localhost:8080/post
    final result = await _dio.get<List>('/posts');
    logger.i(result.data);
    logger.i(result.data.runtimeType);

    switch (result.statusCode) {
      case 200:
        return result.data
                ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];
      default:
        throw Exception();
    }
  }
}

final allMountainsRepositoryProvider = Provider<AllMountainsRepository>((ref) {
  return AllMountainsRepositoryImpl();
});
