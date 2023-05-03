import 'dart:convert';

List<StudentMinor> studentMinorFromJson(String str) => List<StudentMinor>.from(
    json.decode(str).map((x) => StudentMinor.fromJson(x)));

String studentMinorToJson(List<StudentMinor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentMinor {
  int? studentminorkey;
  String? studentid;
  String minor;

  StudentMinor({
    this.studentminorkey,
    this.studentid,
    required this.minor,
  });

  factory StudentMinor.fromJson(Map<String, dynamic> json) => StudentMinor(
        studentminorkey: json["studentminorkey"],
        studentid: json["studentid"],
        minor: json["minor"],
      );

  Map<String, dynamic> toJson() => {
        "studentid": studentid,
        "minor": minor,
      };
}
