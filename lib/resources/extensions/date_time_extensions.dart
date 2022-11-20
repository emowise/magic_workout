import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get fromMillsToDateTime => DateFormat("dd/MM/yyyy").format(this);
}
