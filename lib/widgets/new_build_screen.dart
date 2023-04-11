import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';
import 'course_class.dart';
import 'schedule_build.dart';

class StudentBuildScreen extends StatefulWidget {
  const StudentBuildScreen();

  @override
  State<StudentBuildScreen> createState() {
    return StudentBuildScreenState();
  }
}

class StudentBuildScreenState extends State<StudentBuildScreen> {
  StudentBuildScreenState() {
    /* currSchedule = Course(null, null, null, null, null, null, null)
        .mapInit()
        .semesterSchedulesMap[semesterNum] as List<Course>; */
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    /* List<Course> currSchedule = [
      Course('department', 'level', 'module', 'term', 'deptAbbrev',
          'fullModule', 'name')
    ]; */

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF3956F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //put the dropdown menus here
              SizedBox(
                height: screenHeight * .8,
                width: screenWidth * .6,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        ScheduleBuildClass().buildDropdowns(semesterNum),
                        SizedBox(
                            width: screenWidth * .5,
                            child: const Divider(
                              color: Colors.grey,
                            )),
                        Expanded(
                          child: ScheduleBuildClass.semesterNum(semesterNum)
                              .scheduleBuild(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      //Contains schedule builder Widget
    );
  }

  /* List<Course> currSchedule = [
    Course('department', 'level', 'module', 'term', 'deptAbbrev', 'fullModule',
        'name')
  ]; */

  BuildContext get buildContext => context;

  void changeSemester(int num, BuildContext context) {
    print(context.mounted.toString());

    setState(() {
      semesterNum += num;
    });
  }

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
          setState(() {
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

  int semesterNum = 1;

  get semester {
    return semesterNum;
  }
}
