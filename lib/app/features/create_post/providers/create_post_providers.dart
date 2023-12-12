import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';

final titleProvider = StateProvider.autoDispose<String>((ref) => '');
final contentProvider = StateProvider.autoDispose<String>((ref) => '');

/// tags
final tagsProvider = StateProvider.autoDispose<List<String>>((ref) {
  final content = ref.watch(contentProvider);
  return parseTags(content);
});
