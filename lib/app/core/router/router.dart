import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mountain_sharing/app/features/main_page/view/main_page_view.dart';

import '../../features/all_mountains/view/all_mountains_view.dart';
import '../../features/create_post/view/create_post_view.dart';
import '../../features/main/view/main_view.dart';

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // TODO: add your router here
      initialLocation: MainView.routeName,
      routes: [
        /// for showing onboarding
        GoRoute(
          path: MainView.routeName,
          builder: (context, state) => const MainView(),
        ),
        GoRoute(
          path: AllMountainsView.routeName,
          builder: (context, state) => const AllMountainsView(),
        ),
        GoRoute(
          path: MainPageView.routeName,
          builder: (context, state) => const MainPageView(),
        ),
        GoRoute(
          path: CreatePostView.routeName,
          builder: (context, state) => const CreatePostView(),
        ),
      ],
    );
  },
);
