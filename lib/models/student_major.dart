import 'dart:convert';

List<StudentMajor> studentMajorFromJson(String str) => List<StudentMajor>.from(
    json.decode(str).map((x) => StudentMajor.fromJson(x)));

String studentMajorToJson(List<StudentMajor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentMajor {
  int? studentmajorkey;
  String? studentid;
  String major;

  StudentMajor({
    this.studentmajorkey,
    this.studentid,
    required this.major,
  });

  factory StudentMajor.fromJson(Map<String, dynamic> json) => StudentMajor(
        studentmajorkey: json["studentmajorkey"],
        studentid: json["studentid"],
        major: json["major"],
      );

  Map<String, dynamic> toJson() => {
        "studentid": studentid,
        "major": major,
      };
}
