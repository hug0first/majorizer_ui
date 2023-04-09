import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';
import 'course_class.dart';
import 'schedule_build.dart';

class StudentBuildScreen extends StatefulWidget {
  const StudentBuildScreen();

  @override
  State<StudentBuildScreen> createState() => StudentBuildScreenState();
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
      body: ListView(
        children: [
          ListTile(
            title: Text("test"),
          )
        ], //ScheduleBuildClass(semesterNum).scheduleBuildList(),
      ),

      //Contains schedule builder Widget
    );
  }

  /* List<Course> currSchedule = [
    Course('department', 'level', 'module', 'term', 'deptAbbrev', 'fullModule',
        'name')
  ]; */
  int semesterNum = 1;
}
