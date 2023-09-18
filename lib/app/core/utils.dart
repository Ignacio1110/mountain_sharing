import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrefixPrinter(PrettyPrinter(colors: false)),
);
