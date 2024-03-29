import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majorizer_ui/models/models.dart';
import '../api.dart';
import '../models/course_catalog.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen();

  @override
  State<StatefulWidget> createState() => TransferScreenState();
}

class TransferScreenState extends State<TransferScreen> {
  TransferScreenState();

  var departments;
  late List<DropdownMenuItem<String>> modules;
  List<DropdownMenuItem<String>> uniqueModules = [];
  late List<CourseCatalog> catalog;

  Future<List<DropdownMenuItem<String>>> makeDepartmentList(
      String currDept) async {
    catalog = await getCourseCatalog();
    List<DropdownMenuItem<String>> uniqueDepts = [];
    List<DropdownMenuItem<String>> departments = [
      const DropdownMenuItem(
          value: "Select Department", child: Text("Select Department"))
    ];
    for (CourseCatalog course in catalog) {
      String courseId = course.courseid;
      String courseDept = courseId.replaceAll(RegExp('[0-9]'), '');

      departments.add(DropdownMenuItem(
        value: courseDept,
        child: Text(courseDept),
      ));
    }
    var seenCourse = <String>{};
    uniqueDepts = departments
        .where((dept) => seenCourse.add(dept.value.toString()))
        .toList();
    return uniqueDepts;
  }

  Future<List<DropdownMenuItem<String>>> makeCourseList(
      String departmentVal) async {
    catalog = await getCourseCatalog();
    List<DropdownMenuItem<String>> modules = [
      const DropdownMenuItem(
        value: "Select Course",
        child: Text("Select Course"),
      )
    ];
    for (CourseCatalog course in catalog) {
      String courseId = course.courseid;
      String courseDept = courseId.replaceAll(RegExp('[0-9]'), '');

      if (courseDept == departmentVal) {
        modules.add(DropdownMenuItem(
          value: course.coursename,
          child: Text(courseId),
        ));
      }
    }
    var seenCourse = <String>{};
    uniqueModules = modules
        .where((module) => seenCourse.add(module.value.toString()))
        .toList();
    return uniqueModules;
  }

  String departmentVal = "Select Department";
  String moduleVal = "Select Course";
  String courseName = '';
  final semesterController = TextEditingController();
  final gradeController = TextEditingController();
  bool isTransfer = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * .9,
            height: screenHeight * .8,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenWidth * 0.02, 0, screenWidth * 0.02, 0),
                          child: Text(
                            'Previously Taken Course Selection',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth / 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * .52,
                        child: const Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: screenWidth * .05)),
                      FutureBuilder(
                          future: makeDepartmentList(departmentVal)
                              .then((value) => departments = value),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                color: Color(0xFFFFFFFF),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return DropdownButton(
                                  items: departments,
                                  value: departmentVal,
                                  onChanged: (value) {
                                    setState(() {
                                      departmentVal = value!;
                                      moduleVal =
                                          "Select Course"; //resets module selection each time a user changes departments
                                      courseName = '';
                                    });
                                  },
                                );
                              } else {
                                return const Text('Empty data');
                              }
                            } else {
                              return Text('State: ${snapshot.connectionState}');
                            }
                          }),
                      const Padding(
                        padding: EdgeInsets.only(),
                      ),
                      SizedBox(
                        width: screenWidth * .4,
                        child: TextField(
                          controller: semesterController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Semester Taken',
                              hintText: 'Example: "Fall 2023"'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: screenWidth * .05)),
                      FutureBuilder(
                          future: makeCourseList(departmentVal)
                              .then((value) => modules = value),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                color: Color(0xFFFFFFFF),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return DropdownButton(
                                  items: modules,
                                  value: moduleVal,
                                  onChanged: (value) {
                                    setState(() {
                                      moduleVal = value!;
                                      (value != "Select Course")
                                          ? courseName = value
                                          : courseName = '';
                                    });
                                  },
                                );
                              } else {
                                return const Text('Empty data');
                              }
                            } else {
                              return Text('State: ${snapshot.connectionState}');
                            }
                          }),
                      const Padding(padding: EdgeInsets.only()),
                      isTransfer
                          ? SizedBox(width: screenWidth * .4)
                          : SizedBox(
                              width: screenWidth * .4,
                              child: TextField(
                                controller: gradeController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Grade Received',
                                    hintText: 'Example: "B-"'),
                              ),
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "This Is${(isTransfer) ? '' : ' Not'} A Transfer Course"),
                      Switch(
                          value: isTransfer,
                          onChanged: (value) {
                            setState(() {
                              isTransfer = value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Course Name: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth / 60,
                        ),
                      ),
                      Text(
                        courseName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth / 65,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (moduleVal != "Select Course")
                        ? () {
                            sendCourseHistory(CourseHistory(
                                courseid: moduleVal,
                                coursename: courseName,
                                semester: semesterController.text,
                                grade: (gradeController.text == '')
                                    ? '-'
                                    : gradeController.text,
                                status: isTransfer ? "T" : "C"));
                            setState(() {
                              departmentVal = "Select Department";
                              moduleVal = "Select Course";
                              courseName = '';
                              semesterController.clear();
                              gradeController.clear();
                            });
                          }
                        : null, //post request to database if module selected
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      "Add course",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: screenWidth / 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(), //put successfully transferred courses here
        ],
      ),
    );
  }
}
