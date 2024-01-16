import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mountain_sharing/app/features/main/providers/main_providers.dart';
import 'package:mountain_sharing/app/features/main_page/view/main_page_view.dart';

import '../../../core/theme/gen/assets.gen.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  static const routeName = '/main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initFinishAsync = ref.watch(initFinish);

    return initFinishAsync.when(
      loading: () => const SplashScreen(
        loadingFinished: false,
      ),
      error: (err, stack) => Text('Error: $err'),
      data: (data) => SplashScreen(
        loadingFinished: data,
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
    required this.loadingFinished,
  });

  final bool loadingFinished;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Text(routeName),
                ElevatedButton(
                  onPressed: () {
                    context.push(MainPageView.routeName);
                  },
                  child: const Text(
                    'to next page',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => signInWithGoogle(),
                  child: const Text(
                    'Google 登入',
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (c, snapshot) {
                    return Text('$snapshot');
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Animate(
              effects: [
                if (loadingFinished)
                  MoveEffect(
                    duration: 3.seconds,
                    begin: const Offset(0, 0),
                    end: const Offset(-100, 0),
                  )
              ],
              child: Assets.images.union.image(),
            ),
          ),
          Positioned(
            right: 0,
            top: 129,
            child: Animate(
              effects: [
                if (loadingFinished)
                  MoveEffect(
                    duration: 3.seconds,
                    begin: const Offset(0, 0),
                    end: const Offset(100, 0),
                  )
              ],
              child: Assets.images.union2.image(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Animate(
              effects: [
                if (loadingFinished)
                  MoveEffect(
                    duration: 3.seconds,
                    begin: const Offset(0, 0),
                    end: const Offset(0, 100),
                  )
              ],
              child: Assets.images.vector1.image(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Animate(
              effects: [
                if (loadingFinished)
                  MoveEffect(
                    duration: 3.seconds,
                    begin: const Offset(0, 0),
                    end: const Offset(0, 100),
                  )
              ],
              child: Assets.images.vector2.image(
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
