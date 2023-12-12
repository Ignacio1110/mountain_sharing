import 'package:hooks_riverpod/hooks_riverpod.dart';

final titleProvider = StateProvider.autoDispose<String>((ref) => '');
final contentProvider = StateProvider.autoDispose<String>((ref) => '');
