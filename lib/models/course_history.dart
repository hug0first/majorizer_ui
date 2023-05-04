import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

List<CourseHistory> courseHistoryFromJson(String str) =>
    List<CourseHistory>.from(
        json.decode(str).map((x) => CourseHistory.fromJson(x)));

String courseHistoryToJson(List<CourseHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseHistory {
  CourseHistory({
    required this.courseid,
    required this.coursename,
    required this.semester,
    required this.grade,
    required this.status,
  });

  String courseid;
  String coursename;
  String semester;
  String grade;
  String status;
  String? email = FirebaseAuth.instance.currentUser?.email;

  factory CourseHistory.fromJson(Map<String, dynamic> json) => CourseHistory(
        courseid: json["courseid"],
        coursename: json["coursename"],
        semester: json["semester"],
        grade: json["grade"] ?? "-",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "courseid": courseid,
        "coursename": coursename,
        "semester": semester,
        "grade": grade,
        "status": status,
        "emailaddress": email,
      };
}
