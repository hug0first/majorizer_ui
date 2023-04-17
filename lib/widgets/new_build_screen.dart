import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/student_build_screen.dart';
import 'dropdown_button_lists.dart';
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
  StudentBuildScreenState();

  int semesterNum = 1;
  int scheduleVersion = 1;
  bool showSchedule = false;
  String selectedMajor1 = 'Major 1';
  String selectedMajor2 = 'Major 2';
  String selectedMinor1 = 'Minor 1';
  String selectedMinor2 = 'Minor 2';
  String selectedCoop = 'Coop Term';
  String selectedStudyAbroad = 'Study Abroad Term';
  String selectedGraduation = 'Graduation Term';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //First row of dropdowns TODO
                          children: <Widget>[
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().major1Items,
                              value: selectedMajor1,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMajor1 = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().major2Items,
                              value: selectedMajor2,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMajor2 = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().minor1Items,
                              value: selectedMinor1,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMinor1 = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().minor2Items,
                              value: selectedMinor2,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMinor2 = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ],
                        ),
                        Row(
                          //Second row of dropdowns TODO
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().coopItems,
                              value: selectedCoop,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCoop = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().studyAbroadItems,
                              value: selectedStudyAbroad,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedStudyAbroad = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            DropdownButton<String>(
                              items: dropdownMenuItemClass().graduationItems,
                              value: selectedGraduation,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGraduation = newValue!;
                                });
                              },
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSchedule =
                                      true; //Shows the schedule once user clicks build schedule button
                                });
                              }, //TODO: api request
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFda6237),
                              ),
                              child: const Text("Build Schedule"),
                            ),
                            showSchedule //hides dropdown if not built
                                ? DropdownButton<int>(
                                    items: dropdownMenuItemClass()
                                        .scheduleVersionItems,
                                    value: scheduleVersion,
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        scheduleVersion = newValue!;
                                      });
                                    },
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  )
                                : Container(),
                          ],
                        ),
                        semesterRow(),
                        SizedBox(
                            width: screenWidth * .5,
                            child: const Divider(
                              color: Colors.grey,
                            )),
                        Expanded(
                          child:
                              showSchedule //hides schedule until user presses build schedule button
                                  ? ScheduleBuildClass.semesterNum(semesterNum)
                                      .scheduleBuild()
                                  : Container(),
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
    );
  }

  void updateSemester(int num) {
    if (0 < (semesterNum + num) && (semesterNum + num) < 9) {
      setState(() {
        semesterNum += num;
      });
    }
  }

  Widget semesterRow() {
    return Padding(
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
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateSemester(-1);
                },
                icon: const Icon(Icons.arrow_left),
              ),
              IconButton(
                onPressed: () {
                  updateSemester(1);
                },
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
