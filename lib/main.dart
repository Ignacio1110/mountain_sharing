import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mountain_sharing/firebase_options_dev.dart';
import 'package:mountain_sharing/i18n/strings.g.dart';

import 'app/app.dart';
import 'app/core/local_storage/app_storage.dart';
import 'app/features/all_mountains/repository/all_mountains_repository_fake.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // for initializing local storage
  final appStorage = AppStorage();
  await appStorage.initAppStorage();
  final fakeRepository = AllMountainsRepositoryFake();

  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  LocaleSettings.useDeviceLocale(); // and this

  runApp(
    ProviderScope(
      overrides: [
        appStorageProvider.overrideWithValue(appStorage),
        // allMountainsRepositoryProvider.overrideWithValue(fakeRepository)
      ],
      child: TranslationProvider(
        child: const App(),
      ),
    ),
  );
}
