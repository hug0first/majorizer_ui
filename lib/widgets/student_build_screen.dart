import 'dart:html';

import 'package:flutter/material.dart';
import 'package:majorizer_ui/main.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class StudentBuildScreen extends StatefulWidget {
  const StudentBuildScreen();

  @override
  State<StudentBuildScreen> createState() => StudentBuildScreenState();
}

List<DropdownMenuItem<String>> get major1Items {
  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: "Major 1", child: Text("Major 1")),
    const DropdownMenuItem(
        value: "Computer Science", child: Text("Computer Science")),
    const DropdownMenuItem(value: "Mathematics", child: Text("Mathematics")),
    const DropdownMenuItem(value: "Chemistry", child: Text("Chemistry")),
    const DropdownMenuItem(value: "Psychology", child: Text("Psychology")),
    const DropdownMenuItem(
        value: "Chemical Engineering", child: Text("Chemical Engineering")),
  ];
  /* if (currMajors.isNotEmpty) {
    items[0] =
        DropdownMenuItem(value: currMajors[0], child: Text(currMajors[0]));
  } */
  return items;
}

List<DropdownMenuItem<String>> get major2Items {
  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: "Major 2", child: Text("Major 2")),
    const DropdownMenuItem(
        value: "Computer Science", child: Text("Computer Science")),
    const DropdownMenuItem(value: "Mathematics", child: Text("Mathematics")),
    const DropdownMenuItem(value: "Chemistry", child: Text("Chemistry")),
    const DropdownMenuItem(value: "Psychology", child: Text("Psychology")),
    const DropdownMenuItem(
        value: "Chemical Engineering", child: Text("Chemical Engineering")),
  ];

  return items;
}

List<DropdownMenuItem<String>> get minor1Items {
  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: "Minor 1", child: Text("Minor 1")),
    const DropdownMenuItem(
        value: "Computer Science", child: Text("Computer Science")),
    const DropdownMenuItem(value: "Mathematics", child: Text("Mathematics")),
    const DropdownMenuItem(value: "Chemistry", child: Text("Chemistry")),
    const DropdownMenuItem(value: "Psychology", child: Text("Psychology")),
    const DropdownMenuItem(
        value: "Chemical Engineering", child: Text("Chemical Engineering")),
  ];
  return items;
}

List<DropdownMenuItem<String>> get minor2Items {
  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: "Minor 2", child: Text("Minor 2")),
    const DropdownMenuItem(
        value: "Computer Science", child: Text("Computer Science")),
    const DropdownMenuItem(value: "Mathematics", child: Text("Mathematics")),
    const DropdownMenuItem(value: "Chemistry", child: Text("Chemistry")),
    const DropdownMenuItem(value: "Psychology", child: Text("Psychology")),
    const DropdownMenuItem(
        value: "Chemical Engineering", child: Text("Chemical Engineering")),
  ];
  return items;
}

List<DropdownMenuItem<String>> get termItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Term", child: Text("Term")),
    const DropdownMenuItem(value: "Spring 2024", child: Text("Spring 2024")),
    const DropdownMenuItem(value: "Fall 2023", child: Text("Fall 2023")),
    const DropdownMenuItem(value: "Spring 2023", child: Text("Spring 2023")),
    const DropdownMenuItem(value: "Fall 2022", child: Text("Fall 2022")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get studyAbroadItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "Study Abroad Term", child: Text("Study Abroad Term")),
    const DropdownMenuItem(value: "Spring 2024", child: Text("Spring 2024")),
    const DropdownMenuItem(value: "Fall 2023", child: Text("Fall 2023")),
    const DropdownMenuItem(value: "Spring 2023", child: Text("Spring 2023")),
    const DropdownMenuItem(value: "Fall 2022", child: Text("Fall 2022")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get coopItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Coop Term", child: Text("Coop Term")),
    const DropdownMenuItem(value: "Spring 2024", child: Text("Spring 2024")),
    const DropdownMenuItem(value: "Fall 2023", child: Text("Fall 2023")),
    const DropdownMenuItem(value: "Spring 2023", child: Text("Spring 2023")),
    const DropdownMenuItem(value: "Fall 2022", child: Text("Fall 2022")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get graduationItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "Graduation Term", child: Text("Graduation Term")),
    const DropdownMenuItem(value: "Spring 2024", child: Text("Spring 2024")),
    const DropdownMenuItem(value: "Fall 2023", child: Text("Fall 2023")),
    const DropdownMenuItem(value: "Spring 2023", child: Text("Spring 2023")),
    const DropdownMenuItem(value: "Fall 2022", child: Text("Fall 2022")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get departmentItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Department", child: Text("Department")),
    const DropdownMenuItem(
        value: "Computer Science", child: Text("Computer Science")),
    const DropdownMenuItem(value: "Chemistry", child: Text("Chemistry")),
    const DropdownMenuItem(value: "Mathematics", child: Text("Mathematics")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get levelItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Level", child: Text("Level")),
    const DropdownMenuItem(value: "100", child: Text("100")),
    const DropdownMenuItem(value: "200", child: Text("200")),
    const DropdownMenuItem(value: "300", child: Text("300")),
    const DropdownMenuItem(value: "400", child: Text("400")),
    const DropdownMenuItem(
        value: "500 and Above", child: Text("500 and Above")),
  ];
  return menuItems;
}

class Course {
  String department;
  String level;
  String module;
  String term;
  String deptAbbrev;
  String fullModule;
  String name;

  List<Course> get allCourses {
    List<Course> allCourses = [
      Course("Computer Science", "300", "41", "Fall 2023", "CS", "341",
          "Intro to CS"),
      Course("Chemistry", "100", "31", "Fall 2023", "CH", "131",
          "Intro Chemistry"),
      Course(
          "Mathematics", "100", "31", "Fall 2023", "MA", "131", "Calculuis I"),
      Course("Computer Science", "200", "42", "Spring 2024", "CS", "242",
          "Intro to CS 2"),
      Course("Univ", "100", "00", "Fall 2023", "UNIV", "100",
          "The Clarkson Seminar"),
    ];
    return allCourses;
  }

  Course(this.department, this.level, this.module, this.term, this.deptAbbrev,
      this.fullModule, this.name);

  List<ListTile> filter(String departmentFilter, String levelFilter,
      String moduleFilter, String termFilter) {
    String department = "";
    String level = "";
    String module = "";
    String term = "";
    List<ListTile> filteredCourses = [];

    for (var course in allCourses) {
      String courseDepartment = course.department;
      String courseLevel = course.level[0];
      String courseModule = course.module;
      String courseTerm = course.term;
      if ((courseDepartment == departmentFilter) ||
          (courseLevel == levelFilter) ||
          (courseModule == moduleFilter) ||
          (courseTerm == termFilter)) {
        filteredCourses.add(ListTile(
          title:
              Text("$courseDepartment $courseLevel$courseModule $courseTerm"),
        ));
      }
    }
    return filteredCourses;
  }
}

class StudentBuildScreenState extends State<StudentBuildScreen> {
  String selectedTerm = "Term";
  String selectedDepartment = "Department";
  String selectedLevel = "Level";
  String selectedModule = "Module";
  String selectedStudyAbroad = "Study Abroad Term";
  String selectedCoop = "Coop Term";
  String selectedGraduation = "Graduation Term";
  String selectedMajor1 = "Major 1";
  String selectedMajor2 = "Major 2";
  String selectedMinor1 = "Minor 1";
  String selectedMinor2 = "Minor 2";
  bool classSelected = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    int semesterNum = 1;

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
            //Left Column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                //First Row Left Column
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Term Selection
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: DropdownButton<String>(
                        items: termItems,
                        value: selectedTerm,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTerm = newValue!;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: Row(
                  //Second Row Left Column
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                    //TODO: Department Selection
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: DropdownButton<String>(
                        items: departmentItems,
                        value: selectedDepartment,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDepartment = newValue!;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 100)),
                    //Level Selection
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: DropdownButton<String>(
                        items: levelItems,
                        value: selectedLevel,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLevel = newValue!;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: SizedBox(
                  width: screenWidth * .275,
                  height: screenHeight * .5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Add to Selected Semester",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * .23,
                          child: const Divider(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          //TODO: This is the filtered course list

                          height: screenHeight * .385,
                          child: ListView.builder(
                            itemCount: filter(context, selectedDepartment,
                                    selectedLevel, selectedTerm)
                                .length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Text(
                                    //CS Intro To Programming, for example
                                    "${filter(context, selectedDepartment, selectedLevel, selectedTerm)[index].deptAbbrev} ${filter(context, selectedDepartment, selectedLevel, selectedTerm)[index].name}"),
                                value: false,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * .65,
                height: MediaQuery.of(context).size.height * .8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(bottom: 25)),
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
                              items: major1Items,
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
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              items: major2Items,
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
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              items: minor1Items,
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
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              items: minor2Items,
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
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 25)),
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
                              items: studyAbroadItems,
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
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              items: coopItems,
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
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: DropdownButton<String>(
                              items: graduationItems,
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
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            child: const Text("Build Schedule"),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 25)),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * .6,
                        height: MediaQuery.of(context).size.height * .05,
                        padding: const EdgeInsets.fromLTRB(28.0, 4, 28.0, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                "Semester $semesterNum",
                                style: const TextStyle(
                                  fontSize: 42.0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    if (semesterNum == 1) {
                                      Null;
                                    } else {
                                      setState(() {
                                        semesterNum--;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_left,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      semesterNum++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(Icons.arrow_right),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .65,
                        height: MediaQuery.of(context).size.height * .05,
                        child: const Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: classList(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListView classList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(height: MediaQuery.of(context).size.width * .01),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            "${classes[index].deptAbbrev} ${allCourses[index].fullModule}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width / 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          trailing: Text(
            classes[index].name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width / 65,
            ),
          ),
        );
      },
      itemCount: allCourses.length,
    );
  }

  List<Course> filter(BuildContext context, String departmentFilter,
      String levelFilter, String termFilter) {
    String department = "";
    String level = "";
    String module = "";
    String term = "";
    List<Course> filteredCourses = [];

    for (var course in allCourses) {
      String courseDepartment = course.department;
      String courseLevel = course.level;
      String courseModule = course.module;
      String courseTerm = course.term;

      bool departmentBool = true;
      bool levelBool = true;
      bool moduleBool = true;
      bool termBool = true;

      if (courseDepartment == departmentFilter) {
        departmentBool = true;
      } else if (departmentFilter == "Department") {
        departmentBool = true;
      } else {
        departmentBool = false;
      }

      if (courseLevel == levelFilter) {
        levelBool = true;
      } else if (levelFilter == "Level") {
        levelBool = true;
      } else {
        levelBool = false;
      }

      /* if (courseModule == moduleFilter) {
        moduleBool = true;
      } else if (moduleFilter == "Module") {
        moduleBool = true;
      } else {
        moduleBool = false;
      } */

      if (courseTerm == termFilter) {
        termBool = true;
      } else if (termFilter == "Term") {
        termBool = true;
      } else {
        termBool = false;
      }

      if ((departmentBool) && (levelBool) && (moduleBool) && (termBool)) {
        filteredCourses.add(Course(
            course.department,
            course.level,
            course.module,
            course.term,
            course.deptAbbrev,
            course.fullModule,
            course.name));
      }
    }
    return filteredCourses;
  }

  List<Course> get allCourses {
    List<Course> allCourses = [
      Course("Computer Science", "300", "41", "Fall 2023", "CS", "341",
          "Intro to CS"),
      Course("Chemistry", "100", "31", "Fall 2023", "CH", "131",
          "Intro Chemistry"),
      Course(
          "Mathematics", "100", "31", "Fall 2023", "MA", "131", "Calculuis I"),
      Course("Computer Science", "200", "42", "Spring 2024", "CS", "242",
          "Intro to CS 2"),
      Course("Univ", "100", "00", "Fall 2023", "UNIV", "100",
          "The Clarkson Seminar"),
    ];
    return allCourses;
  }

  List<Course> get classes {
    List<Course> classes = [
      Course("Computer Science", "100", "01", "Fall 2023", "CS", "101",
          "Intro CS 101"),
      Course(
          "Chemistry", "100", "05", "Fall 2023", "CH", "105", "Intro Chem 105"),
      Course("Mathematics", "200", "03", "Fall 2023", "MA", "203", "Calc II"),
      Course("Computer Science", "200", "04", "Fall 2023", "CS", "204",
          "Advanced Programming Concepts in Java"),
      Course("Univ", "100", "01", "Fall 2023", "UNIV", "101", "UNIV 101"),
    ];
    return classes;
  }
}
