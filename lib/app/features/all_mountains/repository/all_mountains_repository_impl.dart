import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/all_mountains_model.dart';
import 'all_mountains_repository.dart';
import 'package:dio/dio.dart';

class AllMountainsRepositoryImpl extends AllMountainsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    final Dio dio = Dio(
      BaseOptions(
        //註記：Android虛擬機連線localhost問題，可以將localhost更改為10.0.2.2。
        baseUrl: 'http://localhost:8080',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
        responseType: ResponseType.json,
      ),
    );

    // http://localhost:8080/post
    final result = await dio.get<List>('/post');

    switch (result.statusCode) {
      case 200:
        return result.data!.map((e) => PostModel.fromJson(e)).toList();
      default:
        throw Exception();
    }
  }

  @override
  Future<List<PostModel>> fetchPosts(PostModel last) async {
    //TODO 去拿真正的資料
    await Future.delayed(const Duration(seconds: 2));
    return [PostModel.fromJson(sample)];
  }
}

final allMountainsRepositoryProvider = Provider<AllMountainsRepository>((ref) {
  return AllMountainsRepositoryImpl();
});
