import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/advisor_students.dart';
import '../models/course_catalog.dart';
import '../models/course_history.dart';
import '../models/student_advisors.dart';

const String urlBase = 'http://127.0.0.1:8000/';
const String advisorStudentsEndpoint = '/advisor_students/';
const String courseCatalogEndpoint = '/course_catalog/';
const String courseHistoryEndpoint = 'course_history/';
const String studentAdvisorsEndpoint = '/student_advisors/';

Future<List<AdvisorStudents>> getAdvisorStudents() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + advisorStudentsEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
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
      headers: {'Origin': 'http://localhost:33921/'},
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
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
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
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
    );

    List<StudentAdvisors> studentAdvisors =
        studentAdvisorsFromJson(response.body);

    return studentAdvisors;
  } catch (e) {
    print(e);
    return [];
  }
}