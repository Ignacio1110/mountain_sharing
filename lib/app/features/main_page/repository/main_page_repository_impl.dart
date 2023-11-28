import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'main_page_repository.dart';

class MainPageRepositoryImpl extends MainPageRepository {
  // TODO add your methods here
}

final mainPageRepositoryProvider = Provider<MainPageRepository>((ref) {
  return MainPageRepositoryImpl();
});
