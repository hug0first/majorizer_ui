import 'package:flutter/material.dart';

class dropdownMenuItemClass {
  List<DropdownMenuItem<int>> get scheduleVersionItems {
    List<DropdownMenuItem<int>> items = List.generate(
        120,
        (index) =>
            DropdownMenuItem(value: index + 1, child: Text('${index + 1}')));
    return items;
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
}
