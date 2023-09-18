import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/core/local_storage/app_storage.dart';
import 'app/features/all_mountains/repository/all_mountains_repository_fake.dart';
import 'app/features/all_mountains/repository/all_mountains_repository_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // for initializing local storage
  final appStorage = AppStorage();
  await appStorage.initAppStorage();
  final fakeRepository = AllMountainsRepositoryFake();

  runApp(
    ProviderScope(
      overrides: [
        appStorageProvider.overrideWithValue(appStorage),
        // allMountainsRepositoryProvider.overrideWithValue(fakeRepository)
      ],
      child: const App(),
    ),
  );
}
