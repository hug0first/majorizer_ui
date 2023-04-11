import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/dropdown_button_lists.dart';
import 'package:majorizer_ui/widgets/new_build_screen.dart';

import 'course_class.dart';
//import 'course_class.dart';

/* class ScheduleBuildState extends StatefulWidget {
  const ScheduleBuildState();

  @override
  State<ScheduleBuildState> createState() => ScheduleBuildClass();
} */

class ScheduleBuildClass extends StatefulWidget {
  //ScheduleBuildState> {
  ScheduleBuildClass();
  ScheduleBuildClass.semesterNum(int semesterNum) {
    scheduleMap = mapInit();
    currSchedule = scheduleMap[semesterNum]!;
  }

  ListView scheduleBuild() {
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
              color: const Color(0xFFda6237),
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
  }

  String selectedItem = "Major 1";

  Widget buildDropdowns(int semesterNum) {
    initState() {}
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                items: dropdownMenuItemClass().major1Items,
                value: selectedItem,
                onChanged: (String? newValue) {
                  StudentBuildScreenState().setState(() {
                    selectedItem = newValue!;
                  });
                },
                style: const TextStyle(
                  color: Colors.black,
                ),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            dropdownScheduleButton(dropdownMenuItemClass().major2Items,
                dropdownMenuItemClass().major2Items[0].value!),
            dropdownScheduleButton(dropdownMenuItemClass().minor1Items,
                dropdownMenuItemClass().minor1Items[0].value!),
            dropdownScheduleButton(dropdownMenuItemClass().minor2Items,
                dropdownMenuItemClass().minor2Items[0].value!),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            dropdownScheduleButton(dropdownMenuItemClass().studyAbroadItems,
                dropdownMenuItemClass().studyAbroadItems[0].value!),
            dropdownScheduleButton(dropdownMenuItemClass().coopItems,
                dropdownMenuItemClass().coopItems[0].value!),
            dropdownScheduleButton(dropdownMenuItemClass().graduationItems,
                dropdownMenuItemClass().graduationItems[0].value!),
            ElevatedButton(
              onPressed: () {}, //api request
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFda6237),
              ),
              child: const Text("Build Schedule"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Semester $semesterNum",
                style: const TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (semesterNum == 1) {
                    Null;
                  } else {
                    initState() {
                      //StudentBuildScreenState.semesterNum--;
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFda6237),
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.arrow_left,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (StudentBuildScreenState().buildContext.mounted) {
                    StudentBuildScreenState().changeSemester(
                        semesterNum, StudentBuildScreenState().buildContext);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFda6237),
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /* void changeSemester(int num) {
    
      StudentBuildScreenState().changeSemester(num, context);
    
  } */

  Widget dropdownScheduleButton(
      List<DropdownMenuItem<String>> items, String selected) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        items: items,
        value: selected,
        onChanged: (String? newValue) {
          StudentBuildScreenState().setState(() {
            selected = newValue!;
          });
        },
        style: const TextStyle(
          color: Colors.black,
        ),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

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
