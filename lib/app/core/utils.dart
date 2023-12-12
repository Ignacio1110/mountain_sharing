import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrefixPrinter(PrettyPrinter(colors: false)),
);

List<String> parseTags(String content) {
  RegExp regex = RegExp(r'#[\u4e00-\u9fa5_a-zA-Z0-9]{1,20}');
  final matches = regex.allMatches(content);
  return matches.map((e) => e.group(0)).whereType<String>().toList();
}
