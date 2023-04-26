import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/side_menu.dart';

class StudentManagerScreen extends StatelessWidget {
  StudentManagerScreen();

  // These are temporary values until the backend/database connection is made
  final students = [
    'Tyler Yankee',
    'Niall Pepper',
    'Peter Dorovitsine',
    'Robert Licata',
    'Sangwon Youn'
  ];
  final majors = [
    'Computer Science',
    'Computer Science',
    'Chemical Engineering',
    'Computer Science',
    'Computer Science'
  ];
  final roles = ['Research', 'Academic', 'Honors', 'Academic', 'Academic'];
  final emails = [
    'yankeets@clarkson.edu',
    'peppernj@clarkson.edu',
    'dorovip@clarkson.edu',
    'licatar@clarkson.edu',
    'youns@clarkson.edu'
  ];

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
              child: const Text('Student Manager',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFFda6237),
                      fontFamily: 'Montserrat'))),
          Flexible(
              child: Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: Row(children: const <Widget>[
              Spacer(flex: 1),
              Expanded(
                  flex: 2,
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Major',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Advising Capacity',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ]),
          )),
          SizedBox(
              width: MediaQuery.of(context).size.width * .82,
              child: const Divider(color: Colors.grey)),
          Flexible(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Row(children: <Widget>[
                      const Spacer(flex: 1),
                      Expanded(flex: 2, child: Text(students[index])),
                      Expanded(
                          flex: 2,
                          child: Text(majors[index],
                              overflow: TextOverflow.ellipsis)),
                      Expanded(flex: 2, child: Text(roles[index])),
                      Expanded(flex: 2, child: Text(emails[index]))
                    ]),
                  );
                }),
          ),
        ]));
  }
}

class AdvisorBuildScreen extends StatelessWidget {
  const AdvisorBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
