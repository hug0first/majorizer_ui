import 'package:http/http.dart' as http;
import 'dart:async';

import 'models/models.dart';

const String urlBase = 'http://127.0.0.1:8000/';
const String advisorStudentsEndpoint = 'advisor_students/';
const String courseCatalogEndpoint = 'course_catalog/';
const String courseHistoryEndpoint = 'course_history/';
const String studentAdvisorsEndpoint = 'student_advisors/';
const String scheduleBuilderEndpoint = 'schedule_builder/';
const String studentMajorEndPoint = 'student_majors/';
const String studentMinorEndPoint = 'student_minors/';
const String advisorEndpoint = 'admin/advisors/';

Future<List<Advisor>> getAdvisors() async {
  try {
    final response = await http.get(
      Uri.parse(urlBase + advisorEndpoint),
    );

    List<Advisor> advisors = advisorFromJson(response.body);

    return advisors;
  } catch (e) {
    print(e);
    return [];
  }
}

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
      Uri.parse(urlBase + studentMajorEndPoint),
    );
    List<StudentMajor> studentMajors = studentMajorFromJson(response.body);
    return studentMajors;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<http.Response> postStudentMajor(List<StudentMajor> m) {
  try {
    final response = http.post(
      Uri.parse(urlBase + studentMajorEndPoint),
      body: studentMajorToJson(m),
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
      Uri.parse(urlBase + studentMajorEndPoint),
      body: studentMajorToJson([m]),
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
      Uri.parse(urlBase + studentMinorEndPoint),
    );
    List<StudentMinor> studentMinors = studentMinorFromJson(response.body);
    return studentMinors;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<http.Response> postStudentMinor(List<StudentMinor> m) {
  try {
    final response = http.post(
      Uri.parse(urlBase + studentMinorEndPoint),
      body: studentMinorToJson(m),
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
      Uri.parse(urlBase + studentMinorEndPoint),
      body: studentMinorToJson([m]),
    );
    return response;
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
