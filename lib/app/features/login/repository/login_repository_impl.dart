import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  // TODO add your methods here
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl();
});
