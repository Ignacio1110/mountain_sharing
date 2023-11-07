import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initFinish = FutureProvider.autoDispose<bool>((ref) {
  return init();
});

Future<bool> init() async {
  await Future.delayed(3.seconds, () {});
  return true;
}
