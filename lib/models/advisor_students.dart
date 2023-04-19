import 'dart:convert';

List<AdvisorStudents> advisorStudentsFromJson(String str) =>
    List<AdvisorStudents>.from(
        json.decode(str).map((x) => AdvisorStudents.fromJson(x)));

String advisorStudentsToJson(List<AdvisorStudents> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvisorStudents {
  AdvisorStudents({
    required this.studentid,
    required this.fname,
    required this.lname,
    required this.emailaddress,
    required this.advisingcapacity,
  });

  String studentid;
  String fname;
  String lname;
  String emailaddress;
  String advisingcapacity;

  factory AdvisorStudents.fromJson(Map<String, dynamic> json) =>
      AdvisorStudents(
        studentid: json["studentid"],
        fname: json["fname"],
        lname: json["lname"],
        emailaddress: json["emailaddress"],
        advisingcapacity: json["advisingcapacity"],
      );

  Map<String, dynamic> toJson() => {
        "studentid": studentid,
        "fname": fname,
        "lname": lname,
        "emailaddress": emailaddress,
        "advisingcapacity": advisingcapacity,
      };
}
