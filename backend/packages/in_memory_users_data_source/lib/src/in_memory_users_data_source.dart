import 'dart:convert';
import 'dart:io';

import 'package:users_data_source/users_data_source.dart';

/// {@template in_memory_users_data_source}
/// users_data_source impl
/// {@endtemplate}
class InMemoryUsersDataSource implements UsersDataSource {
  /// {@macro in_memory_users_data_source}
  InMemoryUsersDataSource() {
    _initUser();
  }

  /// runtime 存在記憶體內的資料
  final _userCache = <String, UserModel>{};

  Future<void> _initUser() async {
    final jsonString = File(
            '/Users/ignacio/Documents/Ignacio/mountain_sharing/backend/packages/in_memory_users_data_source/lib/src/users.json')
        .readAsStringSync();
    final map = jsonDecode(jsonString);
    for (final e in map as List) {
      final userModel = UserModel.fromJson(e as Map<String, dynamic>);
      _userCache[userModel.id] = userModel;
    }
  }

  @override
  Future<UserModel?> read(String id) async {
    return _userCache[id];
  }
}
