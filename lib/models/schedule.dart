// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    required this.sems,
  });

  List<Sem> sems;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        sems: List<Sem>.from(json["sems"].map((x) => Sem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sems": List<dynamic>.from(sems.map((x) => x.toJson())),
      };
}

class Sem {
  Sem({
    required this.time,
    required this.year,
    required this.courses,
    required this.credits,
  });

  String time;
  int year;
  List<String> courses;
  int credits;

  factory Sem.fromJson(Map<String, dynamic> json) => Sem(
        time: json["time"],
        year: json["year"],
        courses: List<String>.from(json["courses"].map((x) => x)),
        credits: json["credits"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "year": year,
        "courses": List<dynamic>.from(courses.map((x) => x)),
        "credits": credits,
      };
}
