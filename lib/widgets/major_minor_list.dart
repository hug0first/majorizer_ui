import 'package:flutter/material.dart';
import '../main.dart';
import 'home_screen.dart';

class MajorMinorList extends State<HomeScreen> {
  List<String> majors = [
    'Computer Science',
    'Mathematics',
    'Chemistry',
    'Psychology',
  ];

  List<String> minors = [
    'Computer Science',
    'Mathematics',
    'Chemistry',
    'Psychology',
  ];

  List<String> possibleMajorList(String currMajor, String currMajor2) {
    List<String> possibleMajors = [];

    for (var major in majors) {
      if (!currMajors.contains(major) && !currMinors.contains(major)) {
        possibleMajors.add(major);
      }
    }
    return possibleMajors;
  }

  List<ListTile> possibleMajorListTiles() {
    List<ListTile> majorListTiles = [];
    for (var major in possibleMajorList(currMajor, currMajor2)) {
      majorListTiles.add(ListTile(
        title: Text(major),
        trailing: IconButton(
          padding: const EdgeInsets.all(25),
          onPressed: () {
            HomeScreenState().addToCurrMajors('test');
          }, //add a new major from a search bar
          icon: const Icon(Icons.add),
          color: const Color(0xFFda6237),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ));
    }
    return majorListTiles;
  }

  List<String> possibleMinorList(String currMinor, String currMinor2) {
    List<String> possibleMinors = [];

    for (var minor in minors) {
      if (!currMajors.contains(minor) && !currMinors.contains(minor)) {
        possibleMinors.add(minor);
      }
    }
    return possibleMinors;
  }

  TextFormField majorSearch() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Add Major',
        hintText: 'Major Title',
      ),
      controller: majorTitleTextController,
    );
  }

  TextFormField minorSearch() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Add Minor',
        hintText: 'Minor Title',
      ),
      controller: minorTitleTextController,
    );
  }

  @override
  Widget build(BuildContext context) {
    // this just needs to be here for compilation - there is nothing to build
    throw UnimplementedError();
  }
}
