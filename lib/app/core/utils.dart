import 'package:logger/logger.dart';
import 'package:mountain_sharing/i18n/strings.g.dart';

final logger = Logger(
  printer: PrefixPrinter(PrettyPrinter(colors: false)),
);

List<String> parseTags(String content) {
  RegExp regex = RegExp(r'#[\u4e00-\u9fa5_a-zA-Z0-9]{1,20}');
  final matches = regex.allMatches(content);
  return matches.map((e) => e.group(0)).whereType<String>().toList();
}

/// Change the locale
void changeLocale(String locale) {
  final appLocale = AppLocaleUtils.parse(locale);
  if (LocaleSettings.currentLocale != appLocale) {
    LocaleSettings.setLocale(appLocale);

    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('locale', locale);
  }
}
