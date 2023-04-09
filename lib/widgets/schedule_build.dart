import 'package:flutter/material.dart';
import 'course_class.dart';

class ScheduleBuildClass {
  ScheduleBuildClass(int semesterNum) {
    /*  currSchedule = Course(null, null, null, null, null, null, null)
        .mapInit()
        .semesterSchedulesMap[semesterNum] as List<Course>; */
  }

  List<ListTile> scheduleBuildList() {
    List<ListTile> schedule = [];
    for (Course course in currSchedule) {
      schedule.add(ListTile(
        leading: Text(
          "${course.deptAbbrev} ${course.fullModule}",
        ),
        trailing: Text(
          "${course.name}",
        ),
      ));
    }
    return schedule;

    /*  return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(
            "${currSchedule[index].deptAbbrev} ${currSchedule[index].fullModule}",
          ),
          trailing: Text(
            "${currSchedule[index].name}",
          ),
        );
      },
      itemCount: currSchedule.length,
    ); */
  }

  List<Course> currSchedule = [
    Course("department", "level", "module", "term", "deptAbbrev", "fullModule",
        "name")
  ];
}
