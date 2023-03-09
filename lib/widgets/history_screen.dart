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
          // Title, Search, and Column Labels ----------------------------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            color: const Color(0xFFF3956F),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Title -------------------------------------------------------
                const Expanded(
                  flex: 2,
                  child: Text('Course history',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      )),
                ),
                // Search Bar --------------------------------------------------
                Container(
                  height: 45,
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 5,
                  ),
                  margin: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(maxWidth: 400, minWidth: 200),
                  child: TextField(
                    onChanged: searchCourses,
                    style: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Color(0xFFda6237))),
                    ),
                  ),
                ),
              ]),
              // Column Labels -------------------------------------------------
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFF3956F), width: 4),
                  color: Colors.white,
                ),
                child: Row(children: <Widget>[
                  Expanded(
                      flex: 2, child: buildColumnLabel(context, 'Course ID')),
                  Expanded(
                      flex: 5,
                      child: buildColumnLabel(context, 'Course Title')),
                  Expanded(flex: 2, child: buildColumnLabel(context, 'Term')),
                  Expanded(child: buildColumnLabel(context, 'Grade')),
                  Expanded(child: buildColumnLabel(context, 'Credits')),
                  Expanded(flex: 2, child: buildColumnLabel(context, 'Status'))
                ]),
              ),
            ]),
          ),
          // Course List -------------------------------------------------------
          Flexible(
            flex: 4,
            child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseListItem(
                    courseID: courses[index],
                    courseTitle: titles[index],
                    term: term[index],
                    grade: grades[index],
                    credits: credits[index],
                    status: status[index],
                  );
                }),
          ),
        ]));
  }

  // these are the event handler for searching and filtering courses...will figure this out later
  searchCourses(String text) async {}

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

class CourseListItem extends StatelessWidget {
  final String courseID;
  final String courseTitle;
  final String term;
  final String grade;
  final String credits;
  final String status;
  static Color primaryColor = const Color(0xFFF3956F);
  static Color secondaryColor = const Color(0xFFFFFFFF);

  const CourseListItem(
      {super.key,
      required this.courseID,
      required this.courseTitle,
      required this.term,
      required this.grade,
      required this.credits,
      required this.status});

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
            Expanded(flex: 2, child: buildTextItem(context, courseID)),
            Expanded(flex: 5, child: buildTextItem(context, courseTitle)),
            Expanded(flex: 2, child: buildTextItem(context, term)),
            Expanded(child: buildTextItem(context, grade)),
            Expanded(child: buildTextItem(context, credits)),
            Expanded(flex: 2, child: buildTextItem(context, status)),
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
