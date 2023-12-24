import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils.dart';

final titleProvider = StateProvider.autoDispose<String>((ref) => '');
final contentProvider = StateProvider.autoDispose<String>((ref) => '');
final imageFileProvider = StateProvider.autoDispose<XFile?>((ref) => null);

/// tags
final tagsProvider = StateProvider.autoDispose<List<String>>((ref) {
  final content = ref.watch(contentProvider);
  return parseTags(content);
});
