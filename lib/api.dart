import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'models/models.dart';

const Map<String, String> baseHeaders = {
  // 'Content-Type': 'application/json; charset=UTF-8'
};
const String urlBase = '127.0.0.1:8000';
const String advisorStudentsEndpoint = '/advisor_students/';
const String courseCatalogEndpoint = '/course_catalog/';
const String courseHistoryEndpoint = '/course_history/';
const String studentAdvisorsEndpoint = '/student_advisors/';
const String scheduleBuilderEndpoint = '/schedule_builder/';
const String studentMajorEndPoint = '/student_majors/';
const String studentMinorEndPoint = '/student_minors/';
const String advisorEndpoint = '/admin/advisors/';

// TODO: add advisor get and post
// Future<List<Advisor>> getAdvisors() async {
//   try {
//     final response = await http.get(
//       Uri.parse(urlBase + advisorEndpoint),
//     );

//     List<Advisor> advisors = advisorFromJson(response.body);

//     return advisors;
//   } catch (e) {
//     print(e);
//     return [];
//   }
// }

Future<List<AdvisorStudents>> getAdvisorStudents() async {
  try {
    final response = await http.post(
      Uri.http(urlBase, advisorStudentsEndpoint),
      headers: baseHeaders,
      body: json.encode({"emailaddress": "yankeets@clarkson.edu"}),
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
    final response = await http.post(
      Uri.http(urlBase, courseHistoryEndpoint),
      headers: baseHeaders,
      body: json
          .encode({"emailaddress": FirebaseAuth.instance.currentUser?.email}),
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
    final response = await http.put(
      Uri.http(urlBase, courseHistoryEndpoint),
      headers: baseHeaders,
      body: course.toJson(),
    );
  } catch (e) {
    print(e);
  }
}

Future<List<CourseCatalog>> getCourseCatalog() async {
  try {
    final response = await http.get(
      Uri.http(urlBase, courseCatalogEndpoint),
      headers: baseHeaders,
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
    final response = await http.post(
      Uri.http(urlBase, studentAdvisorsEndpoint),
      headers: baseHeaders,
      body: json
          .encode({"emailaddress": FirebaseAuth.instance.currentUser?.email}),
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
    final response = await http.post(
      Uri.http(urlBase, scheduleBuilderEndpoint),
      headers: baseHeaders,
      body: json
          .encode({"emailaddress": FirebaseAuth.instance.currentUser?.email}),
    );
    List<Schedule> schedule = scheduleFromJson(response.body);
    return schedule;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<List<StudentMajor>> getStudentMajor() async {
  try {
    final response = await http.get(
      Uri.http(urlBase, studentMajorEndPoint),
      headers: baseHeaders,
    );
    List<StudentMajor> studentMajors = studentMajorFromJson(response.body);
    return studentMajors;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<http.Response> postStudentMajor(StudentMajor m) {
  try {
    final response = http.post(
      Uri.http(urlBase, studentMajorEndPoint),
      headers: baseHeaders,
      body: m.toJson(),
    );

    return response;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

Future<http.Response> deleteStudentMajor(StudentMajor m) {
  try {
    final response = http.delete(
      Uri.http(urlBase, studentMajorEndPoint, {'pk': m.studentmajorkey}),
      headers: baseHeaders,
    );
    return response;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

Future<List<StudentMinor>> getStudentMinor() async {
  try {
    final response = await http.get(
      Uri.http(urlBase, studentMinorEndPoint),
      headers: baseHeaders,
    );
    List<StudentMinor> studentMinors = studentMinorFromJson(response.body);
    return studentMinors;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<http.Response> postStudentMinor(StudentMinor m) {
  try {
    final response = http.post(
      Uri.http(urlBase, studentMinorEndPoint),
      headers: baseHeaders,
      body: m.toJson(),
    );
    return response;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

Future<http.Response> deleteStudentMinor(StudentMinor m) {
  try {
    final response = http.delete(
      Uri.http(urlBase, studentMinorEndPoint, {'pk': m.studentminorkey}),
      headers: baseHeaders,
      body: m.toJson(),
    );

    return response;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
