import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/features/all_mountains/view/all_mountains_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainView extends ConsumerWidget {
  /// TODO add your comment here
  const MainView({super.key});

  static const routeName = '/main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(routeName),
            ElevatedButton(
                onPressed: () {
                  context.push(AllMountainsView.routeName);
                },
                child: const Text(
                  'to next page',
                ))
          ],
        ),
      ),
    );
  }
}
