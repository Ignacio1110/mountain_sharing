import 'package:users_data_source/users_data_source.dart';

/// {@template users_data_source}
/// A generic interface for managing users.
/// {@endtemplate}
abstract class UsersDataSource {
  /// {@macro users_data_source}
  const UsersDataSource();

  /// Return a user
  Future<UserModel?> read(String id);
}
