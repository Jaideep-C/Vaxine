// To parse this JSON data, do
//
//     final session = sessionFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Session sessionFromMap(Map<String, dynamic> json) => Session.fromMap(json);

String sessionToMap(Session data) => json.encode(data.toMap());

class Session {
  Session({
    @required this.sessionId,
    @required this.date,
    @required this.availableCapacity,
    @required this.minAgeLimit,
    @required this.vaccine,
    @required this.slots,
  });

  final String sessionId;
  final String date;
  final int availableCapacity;
  final int minAgeLimit;
  final String vaccine;
  final List<String> slots;

  factory Session.fromMap(Map<String, dynamic> json) => Session(
    sessionId: json["session_id"],
    date: json["date"],
    availableCapacity: json["available_capacity"],
    minAgeLimit: json["min_age_limit"],
    vaccine: json["vaccine"],
    slots: List<String>.from(json["slots"].map((x) =>x)),
  );

  Map<String, dynamic> toMap() => {
    "session_id": sessionId,
    "date": date,
    "available_capacity": availableCapacity,
    "min_age_limit": minAgeLimit,
    "vaccine": vaccine,
    "slots": List<dynamic>.from(slots.map((x) => x)),
  };
}
