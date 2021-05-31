
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mod/data/centers.dart';
import 'package:mod/data/vaccine.dart';

class Api {
  static Uri _url(String pincode, String today) => Uri.parse(
      "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pincode&date=$today");

  static Future<List<VaccineCenter>> fetchCentersList(String pincode, String today) async {
    final res = await http.get(_url(pincode, today));
    print(res.body);
    if(res.statusCode==200){
      final vaccineRes=vaccineResFromMap(res.body);
      return vaccineRes.vaccineCenters;
    }
    throw(json.decode(res.body)["error"]);
  }
}
