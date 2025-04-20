// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

// 参考：https://github.com/dart-archive/intl/blob/eb4ab704c4a3c48d957b2a188c6b452051a093a7/lib/date_time_patterns.dart#L2707

extension DateTimeFormatter on DateTime {
  /// M月d日(EEE)
  String MMMEd() {
    final formatter = DateFormat.MMMEd();
    final formatted = formatter.format(this);
    return formatted;
  }
}
