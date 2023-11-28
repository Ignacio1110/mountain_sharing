import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedIndex = StateProvider.autoDispose<int>((ref) => 0);
