import 'package:flutter/material.dart';
import 'package:majorizer_ui/api.dart';
import 'package:majorizer_ui/main.dart';
import 'package:majorizer_ui/models/models.dart';
import 'dropdown_button_lists.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';
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

  late ListView builtSchedule;
  late List<ListView> semesterList;
  late List<Schedule> allSchedules = [];
  late var scheduleView;
  int semesterNum = 1;
  int scheduleVersion = 1;
  int numSemesters = 1;
  late int numSchedules;
  bool showSchedule = false;
  bool scheduleIsChanged = true;
  String selectedMajor1 = (currMajors.isEmpty) ? 'Major 1' : currMajors[0];
  String selectedMajor2 = (currMajors.length < 2) ? 'Major 2' : currMajors[1];
  String selectedMinor1 = (currMinors.isEmpty) ? 'Minor 1' : currMinors[0];
  String selectedMinor2 = (currMinors.length < 2) ? 'Minor 2' : currMinors[1];
  String selectedCoop = 'Coop Term';
  String selectedStudyAbroad = 'Study Abroad Term';
  String selectedGraduation = 'Graduation Term';

  Widget scheduleVersionDropdown = Container();

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
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: screenHeight * .8,
                width: screenWidth * .9,
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
                                  deleteStudentMajor(StudentMajor(
                                      studentid: 'S0001',
                                      major: selectedMajor1));
                                  selectedMajor1 = newValue!;
                                  postStudentMajor(
                                      StudentMajor(major: selectedMajor1));
                                  scheduleView = scheduleViewBuilder(false);
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
                                  deleteStudentMajor(StudentMajor(
                                      studentid: 'S0001',
                                      major: selectedMajor2));
                                  selectedMajor2 = newValue!;
                                  postStudentMajor(
                                      StudentMajor(major: selectedMajor2));
                                  scheduleView = scheduleViewBuilder(false);
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
                                  deleteStudentMinor(StudentMinor(
                                      studentid: 'S0001',
                                      minor: selectedMinor1));
                                  selectedMinor1 = newValue!;
                                  postStudentMinor(
                                      StudentMinor(minor: selectedMinor1));
                                  scheduleView = scheduleViewBuilder(false);
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
                                  deleteStudentMinor(StudentMinor(
                                      studentid: 'S0001',
                                      minor: selectedMinor2));
                                  selectedMinor2 = newValue!;
                                  postStudentMinor(
                                      StudentMinor(minor: selectedMinor2));
                                  scheduleView = scheduleViewBuilder(false);
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
                                  scheduleView = scheduleViewBuilder(false);
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
                                  scheduleView = scheduleViewBuilder(false);
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
                                  scheduleView = scheduleViewBuilder(false);
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
                                  /* ScheduleBuildClass.semesterNum(semesterNum)
                                      .initSchedules(
                                          true, allSchedules)
                                      .then((value) => allSchedules = value); */
                                  scheduleView = scheduleViewBuilder(true);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              child: const Text("Build Schedule"),
                            ),
                            showSchedule //hides dropdown if not built
                                ? scheduleSelection()
                                : Container(),
                          ],
                        ),
                        semesterRow(),
                        SizedBox(
                            width: screenWidth * .879,
                            child: const Divider(
                              color: Colors.black,
                            )),
                        Expanded(
                          child:
                              showSchedule //hides schedule until user presses build schedule button
                                  ? scheduleView
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

  FutureBuilder scheduleViewBuilder(bool scheduleIsChanged) {
    FutureBuilder scheduleView = FutureBuilder(
        future: ScheduleBuildClass.semesterNum(semesterNum)
            .initSchedules(scheduleIsChanged, allSchedules)
            .then((value) => allSchedules = value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .05)),
                const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                      "Please be patient, schedule may take a while to build..."),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              numSemesters = ScheduleBuildClass.semesterNum(semesterNum)
                  .numberOfSemesters(
                      semesterNum, scheduleVersion, allSchedules);

              return ScheduleBuildClass.semesterNum(semesterNum)
                  .scheduleBuild(semesterNum, scheduleVersion, allSchedules);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });

    return scheduleView;
  }

  Widget scheduleSelection() {
    //still doesn't properly update the dropdown

    numSchedules = ScheduleBuildClass.semesterNum(semesterNum)
        .numberOfSchedules(allSchedules);

    return Row(
      children: <Widget>[
        IconButton(
          onPressed: (scheduleVersion > 1)
              ? () {
                  setState(() {
                    scheduleVersion--;
                    numSemesters = ScheduleBuildClass.semesterNum(semesterNum)
                        .numberOfSemesters(
                            semesterNum, scheduleVersion, allSchedules);
                    if (semesterNum > numSemesters) semesterNum = numSemesters;
                  });
                }
              : null,
          icon: const Icon(Icons.arrow_left),
        ),
        Text("Schedule $scheduleVersion"),
        IconButton(
          onPressed: () {
            numSchedules = ScheduleBuildClass.semesterNum(semesterNum)
                .numberOfSchedules(allSchedules);

            setState(() {
              (scheduleVersion < numSchedules) ? scheduleVersion++ : null;
              numSemesters = ScheduleBuildClass.semesterNum(semesterNum)
                  .numberOfSemesters(
                      semesterNum, scheduleVersion, allSchedules);
              semesterNum = 1;
            });
          },
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }

  void updateSemester(int num) {
    setState(() {
      semesterNum += num;
    });
  }

  Widget semesterRow() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          (showSchedule)
              ? Text(
                  "Semester $semesterNum",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .025,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                )
              : Text(
                  "Semester -",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .025,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: (semesterNum > 1)
                    ? () {
                        updateSemester(-1);
                      }
                    : null,
                icon: const Icon(Icons.arrow_left),
              ),
              IconButton(
                onPressed: (showSchedule)
                    ? () {
                        numSemesters =
                            ScheduleBuildClass.semesterNum(semesterNum)
                                .numberOfSemesters(
                                    semesterNum, scheduleVersion, allSchedules);

                        (semesterNum < numSemesters) ? updateSemester(1) : null;
                      }
                    : null,
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
