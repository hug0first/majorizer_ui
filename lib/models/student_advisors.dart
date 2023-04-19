import 'dart:convert';

List<StudentAdvisors> studentAdvisorsFromJson(String str) =>
    List<StudentAdvisors>.from(
        json.decode(str).map((x) => StudentAdvisors.fromJson(x)));

String studentAdvisorsToJson(List<StudentAdvisors> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentAdvisors {
  StudentAdvisors({
    required this.advisorid,
    required this.fname,
    required this.lname,
    required this.department,
    required this.emailaddress,
    required this.advisingcapacity,
  });

  String advisorid;
  String fname;
  String lname;
  String department;
  String emailaddress;
  String advisingcapacity;

  factory StudentAdvisors.fromJson(Map<String, dynamic> json) =>
      StudentAdvisors(
        advisorid: json["advisorid"],
        fname: json["fname"],
        lname: json["lname"],
        department: json["department"],
        emailaddress: json["emailaddress"],
        advisingcapacity: json["advisingcapacity"],
      );

  Map<String, dynamic> toJson() => {
        "advisorid": advisorid,
        "fname": fname,
        "lname": lname,
        "department": department,
        "emailaddress": emailaddress,
        "advisingcapacity": advisingcapacity,
      };
}
