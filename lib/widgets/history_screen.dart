import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen();

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  // These are temporary values until the backend/database connection is made
  final courses = ['CS 141', 'CS 142', 'CS 241'];
  final titles = [
    'Introduction to Computer Science I',
    'Introduction to Computer Science II',
    'Computer Organization'
  ];
  final term = ['Fall 2021', 'Fall 2021', 'Spring 2022'];
  final grades = ['T', 'A', 'B'];
  final credits = ['4', '3', '3'];
  final status = ['Transferred', 'Taken', 'Taken'];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: mainAppBar(context, scaffoldKey),
        ),
        endDrawer: sideMenu(context),
        body: Column(children: [
          Container(
              height: 75,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 25, left: 40),
              margin: EdgeInsets.zero,
              child: const Text('Course History',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFFda6237),
                      fontFamily: 'Montserrat'))),
          Container(
            width: 2500,
            height: 45,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(left: 1050, right: 75),
            margin: EdgeInsets.zero,
            child: TextField(
                onChanged: searchCourses,
                decoration: const InputDecoration(
                    hintText: 'Search...',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)))),
          ),
          Flexible(
              child: Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: Row(children: <Widget>[
              const Spacer(flex: 1),
              const Expanded(
                  flex: 2,
                  child: Text('Course ID',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  flex: 5,
                  child: Text('Course Title',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  flex: 2,
                  child: Text('Term',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  child: Text('Grade',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  child: Text('Credits',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  flex: 2,
                  child: Text('Status',
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ]),
          )),
          Container(width: 1400, child: const Divider(color: Colors.grey)),
          Flexible(
            child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      const Spacer(flex: 1),
                      Expanded(flex: 2, child: Text(courses[index])),
                      Expanded(
                          flex: 5,
                          child: Text(titles[index],
                              overflow: TextOverflow.ellipsis)),
                      Expanded(flex: 2, child: Text(term[index])),
                      Expanded(child: Text(grades[index])),
                      Expanded(child: Text(credits[index])),
                      Expanded(flex: 2, child: Text(status[index]))
                    ]),
                  );
                }),
          ),
        ]));
  }

  // these are the event handler for searching and filtering courses...will figure this out later
  searchCourses(String text) async {}
}
