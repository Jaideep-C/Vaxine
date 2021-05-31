// To parse this JSON data, do
//
//     final VaccineRes = VaccineResFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'centers.dart';


VaccineRes vaccineResFromMap(String str) => VaccineRes.fromMap(json.decode(str));

String centerToMap(VaccineRes data) => json.encode(data.toMap());

class VaccineRes {
  VaccineRes({
    @required this.vaccineCenters,
  });

  final List<VaccineCenter> vaccineCenters;

  factory VaccineRes.fromMap(Map<String, dynamic> json) => VaccineRes(
    vaccineCenters: List<VaccineCenter>.from(json["centers"].map((x) => VaccineCenter.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "centers": List<dynamic>.from(vaccineCenters.map((x) => x.toMap())),
  };
}
