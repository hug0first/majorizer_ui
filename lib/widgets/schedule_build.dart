import 'package:flutter/material.dart';
import 'package:majorizer_ui/models/models.dart';
import 'package:majorizer_ui/widgets/dropdown_button_lists.dart';
import 'package:majorizer_ui/widgets/new_build_screen.dart';

import '../api.dart';
import 'course_class.dart';
//import 'course_class.dart';

/* class ScheduleBuildState extends StatefulWidget {
  const ScheduleBuildState();

  @override
  State<ScheduleBuildState> createState() => ScheduleBuildClass();
} */

class ScheduleBuildClass extends StatefulWidget {
  //ScheduleBuildState> {
  //ScheduleBuildClass();
  ScheduleBuildClass.semesterNum(this.semesterNum) {
    scheduleMap = mapInit();
    if (scheduleMap.containsKey(semesterNum)) {
      currSchedule = scheduleMap[semesterNum]!;
    } else {
      currSchedule = [];
    }
  }

  Future<List<Schedule>> initSchedules(
      bool isChanged, List<Schedule> allSchedules) async {
    return isChanged ? await getSchedule() : allSchedules;
  }

  int numberOfSemesters(
      int semesterNum, int scheduleVersion, List<Schedule> allSchedules) {
    Schedule schedule = allSchedules[scheduleVersion - 1];
    Sem semester = schedule.sems[semesterNum];
    return semester.courses.length;
  }

  int numberOfSchedules(List<Schedule> allSchedules) {
    return allSchedules.length;
  }

  Future<String> getCourseName(String courseID) async {
    var catalog = await getCourseCatalog();
    for (CourseCatalog course in catalog) {
      if (course.courseid == courseID) return course.coursename;
    }
    return 'No Course Name Available';
  }

  ListView scheduleBuild(
      int semesterNum, int scheduleVersion, List<Schedule> allSchedules) {
    //use scheduleVersion to index from list of schedules
    //use semesterNum to index from list of semesters in a schedule
    //from there return list of courses from the data member
    String courseName = '';
    Schedule schedule = allSchedules[scheduleVersion - 1];
    Sem semester = schedule.sems[semesterNum];

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(
              semester.courses[index],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.width / 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            trailing: FutureBuilder(
                future: getCourseName(semester.courses[index])
                    .then((value) => courseName = value),
                builder: ((context, snapshot) {
                  return Text(
                    courseName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width / 65,
                    ),
                  );
                })),
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 0),
          );
        },
        itemCount: semester.courses.length);
  }

  /* ListView scheduleBuild() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 0),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(
            "${currSchedule[index].deptAbbrev} ${currSchedule[index].fullModule}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width / 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          trailing: Text(
            currSchedule[index].name!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width / 65,
            ),
          ),
        );
      },
      itemCount: currSchedule.length,
    );
  } */

  mapInit() {
    Map<int, List<Course>> semesterSchedulesMap = {
      1: allCourses,
      2: schedule,
    };
    return semesterSchedulesMap;
  }

  //Mock semester course lists

  List<Course> allCourses = [
    Course("Computer Science", "300", "41", "Fall 2023", "CS", "341",
        "Intro to CS"),
    Course(
        "Chemistry", "100", "31", "Fall 2023", "CH", "131", "Intro Chemistry"),
    Course("Mathematics", "100", "31", "Fall 2023", "MA", "131", "Calculuis I"),
    Course("Computer Science", "200", "42", "Spring 2024", "CS", "242",
        "Intro to CS 2"),
    Course("Univ", "100", "00", "Fall 2023", "UNIV", "100",
        "The Clarkson Seminar"),
  ];

  List<Course> schedule = [
    Course("department", "level", "module", "term", "deptAbbrev", "fullModule",
        "name")
  ];

  late Map<int, List<Course>> scheduleMap;
  late List<Course> currSchedule;
  int semesterNum;

  @override
  Widget build(BuildContext context) {
    // TODO: nothing
    throw UnimplementedError();
  }

  @override
  State<StatefulWidget> createState() {
    return StudentBuildScreenState();
  }
}
