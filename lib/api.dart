import 'package:http/http.dart' as http;
import 'dart:async';

import 'models/models.dart';

const String urlBase = 'http://127.0.0.1:8000/';
const String advisorStudentsEndpoint = 'advisor_students/';
const String courseCatalogEndpoint = 'course_catalog/';
const String courseHistoryEndpoint = 'course_history/';
const String studentAdvisorsEndpoint = 'student_advisors/';
const String scheduleBuilderEndpoint = 'schedule_builder/';
const String majorMinorEndPoint = 'student_majorminor/';

Future<List<AdvisorStudents>> getAdvisorStudents() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + advisorStudentsEndpoint),
    );

    List<AdvisorStudents> advisorStudents =
        advisorStudentsFromJson(response.body);

    return advisorStudents;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<List<CourseHistory>> getCourseHistory() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + courseHistoryEndpoint),
    );

    List<CourseHistory> courseHistory = courseHistoryFromJson(response.body);

    return courseHistory;
  } catch (e) {
    print(e);
    return [];
  }
}

sendCourseHistory(CourseHistory course) async {
  try {
    final response = await http.post(Uri.parse(urlBase + courseHistoryEndpoint),
        body: courseHistoryToJson([course]));
  } catch (e) {
    print(e);
  }
}

Future<List<CourseCatalog>> getCourseCatalog() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + courseCatalogEndpoint),
    );

    List<CourseCatalog> courseCatalog = courseCatalogFromJson(response.body);

    return courseCatalog;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<List<StudentAdvisors>> getStudentAdvisors() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + studentAdvisorsEndpoint),
    );

    List<StudentAdvisors> studentAdvisors =
        studentAdvisorsFromJson(response.body);

    return studentAdvisors;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<List<Schedule>> getSchedule() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + scheduleBuilderEndpoint),
    );
    String parsedResponse = response.body.replaceAll(RegExp(r'"{'), '{');
    parsedResponse = parsedResponse.replaceAll(RegExp(r'}"'), '}');
    parsedResponse = parsedResponse.replaceAll(RegExp(r'\\"'), '"');
    List<Schedule> schedule = scheduleFromJson(parsedResponse);

    return schedule;
  } catch (e) {
    print(e);
    return [];
  }
}
