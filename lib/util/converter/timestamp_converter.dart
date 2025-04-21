import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    final dateTime = json.toDate();
    final dateTimeNow = DateTime.now();
    final offsetInHours = dateTimeNow.timeZoneOffset.inHours;
    final offsetDateTime = dateTime.add(Duration(hours: -offsetInHours));
    return offsetDateTime;
  }

  @override
  Timestamp toJson(DateTime object) {
    final dateTimeNow = DateTime.now();
    final offsetInHours = dateTimeNow.timeZoneOffset.inHours;
    final offsetDateTime = object.add(Duration(hours: offsetInHours));
    final utcDateTime = offsetDateTime.toUtc();
    return Timestamp.fromDate(utcDateTime);
  }
}
