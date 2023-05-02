import 'package:majorizer_ui/models/course_history.dart';

import '../api.dart';

class gpaClass {
  gpaClass();

  Map<String, double> gradeMap = {
    "A+": 4,
    "A": 4,
    "A-": 3.667,
    "B+": 3.334,
    "B": 3,
    "B-": 2.667,
    "C+": 2.334,
    "C": 2,
    "C-": 1.667,
    "D": 1,
    "F": 0,
  };

  Future<String> getGPA() async {
    String gpa = '';
    double sum = 0;
    int offset = 0;
    List<CourseHistory> history = await getCourseHistory();
    for (CourseHistory course in history) {
      if (course.grade == "-") {
        offset++;
      } else {
        sum += gradeMap[course.grade]!;
      }
    }
    gpa = (sum / (history.length - offset)).toString();
    return (gpa == "NaN") ? 'N/A' : gpa;
  }
}
