import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

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
        // Title, Search, and Column Labels ----------------------------------
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          color: const Color(0xFFF3956F),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // Title -------------------------------------------------------
              const Expanded(
                flex: 2,
                child: Text('Student Manager',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    )),
              ),
            ]),
            // Column Labels -------------------------------------------------
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF3956F), width: 4),
                color: Colors.white,
              ),
              child: Row(children: <Widget>[
                Expanded(flex: 2, child: buildColumnLabel(context, 'Name')),
                Expanded(flex: 2, child: buildColumnLabel(context, 'Major')),
                Expanded(
                    flex: 2,
                    child: buildColumnLabel(context, 'Advising Capacity')),
                Expanded(flex: 2, child: buildColumnLabel(context, 'Email'))
              ]),
            ),
          ]),
        ),
        // Course List -------------------------------------------------------
        Flexible(
          flex: 4,
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return StudentListItem(
                  name: students[index],
                  major: majors[index],
                  role: roles[index],
                  email: emails[index],
                );
              }),
        ),
      ]),
    );
  }

  Widget buildColumnLabel(BuildContext context, String label) {
    return Text(
      label,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: const Color(0xFFF3956F),
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class StudentListItem extends StatelessWidget {
  final String name;
  final String major;
  final String role;
  final String email;
  static Color primaryColor = const Color(0xFFF3956F);
  static Color secondaryColor = const Color(0xFFFFFFFF);

  const StudentListItem({
    super.key,
    required this.name,
    required this.major,
    required this.role,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: buildTextItem(context, name)),
            Expanded(flex: 2, child: buildTextItem(context, major)),
            Expanded(flex: 2, child: buildTextItem(context, role)),
            Expanded(flex: 2, child: buildTextItem(context, email)),
          ],
        ));
  }

  Widget buildTextItem(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: secondaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
    );
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
