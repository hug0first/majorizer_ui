import 'dart:convert';

List<Advisor> advisorFromJson(String str) =>
    List<Advisor>.from(json.decode(str).map((x) => Advisor.fromJson(x)));

String advisorToJson(List<Advisor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Advisor {
  String advisorid;
  String position;
  String department;
  int userid;

  Advisor({
    required this.advisorid,
    required this.position,
    required this.department,
    required this.userid,
  });

  factory Advisor.fromJson(Map<String, dynamic> json) => Advisor(
        advisorid: json["advisorid"],
        position: json["position"],
        department: json["department"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "advisorid": advisorid,
        "position": position,
        "department": department,
        "userid": userid,
      };
}
