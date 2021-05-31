import 'package:mod/data/session.dart';
import 'package:meta/meta.dart';
class VaccineCenter {
  VaccineCenter({
    @required this.centerId,
    @required this.name,
    @required this.address,
    @required this.stateName,
    @required this.districtName,
    @required this.blockName,
    @required this.pincode,
    @required this.lat,
    @required this.long,
    @required this.from,
    @required this.to,
    @required this.feeType,
    @required this.sessions,
  });

  final int centerId;
  final String name;
  final String address;
  final String stateName;
  final String districtName;
  final String blockName;
  final int pincode;
  final int lat;
  final int long;
  final String from;
  final String to;
  final String feeType;
  final List<Session> sessions;

  factory VaccineCenter.fromMap(Map<String, dynamic> json) => VaccineCenter(
    centerId: json["center_id"],
    name: json["name"],
    address: json["address"],
    stateName: json["state_name"],
    districtName: json["district_name"],
    blockName: json["block_name"],
    pincode: json["pincode"],
    lat: json["lat"],
    long: json["long"],
    from: json["from"],
    to: json["to"],
    feeType: json["fee_type"],
    sessions: List<Session>.from(json["sessions"].map((x) => sessionFromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "center_id": centerId,
    "name": name,
    "address": address,
    "state_name": stateName,
    "district_name": districtName,
    "block_name": blockName,
    "pincode": pincode,
    "lat": lat,
    "long": long,
    "from": from,
    "to": to,
    "fee_type": feeType,
    "sessions": List<Session>.from(sessions.map((x) => x)),
  };
}
