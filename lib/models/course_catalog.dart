import 'dart:convert';

List<CourseCatalog> courseCatalogFromJson(String str) =>
    List<CourseCatalog>.from(
        json.decode(str).map((x) => CourseCatalog.fromJson(x)));

String courseCatalogToJson(List<CourseCatalog> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseCatalog {
  CourseCatalog({
    required this.courseid,
    required this.coursename,
    required this.instructorname,
    required this.description,
    required this.credits,
    required this.semestersoffered,
    required this.commpoints,
    this.knowledgeareas,
    this.prerequisites,
    this.corequisites,
  });

  String courseid;
  String coursename;
  String instructorname;
  String description;
  int credits;
  String semestersoffered;
  int commpoints;
  String? knowledgeareas;
  String? prerequisites;
  String? corequisites;

  factory CourseCatalog.fromJson(Map<String, dynamic> json) => CourseCatalog(
        courseid: json["courseid"],
        coursename: json["coursename"],
        instructorname: json["instructorname"],
        description: json["description"],
        credits: json["credits"],
        semestersoffered: json["semestersoffered"],
        commpoints: json["commpoints"],
        knowledgeareas: json["knowledgeareas"],
        prerequisites: json["prerequisites"],
        corequisites: json["corequisites"],
      );

  Map<String, dynamic> toJson() => {
        "courseid": courseid,
        "coursename": coursename,
        "instructorname": instructorname,
        "description": description,
        "credits": credits,
        "semestersoffered": semestersoffered,
        "commpoints": commpoints,
        "knowledgeareas": knowledgeareas,
        "prerequisites": prerequisites,
        "corequisites": corequisites,
      };
}
