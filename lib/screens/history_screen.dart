import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/side_menu.dart';
import '../api.dart';
import '../models/course_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  late Future<List<CourseHistory>> courseHistory;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    courseHistory = getCourseHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.81,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(35),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            // Title, ////Search ----------------------------------
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // Title -------------------------------------------------------
              Text(
                'Course Catalog',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 50,
                ),
              ),
              IconButton(
                onPressed: () => {
                  sendCourseHistory(CourseHistory(
                      courseid: 'CS 141',
                      coursename: 'Intro to Computer Science I',
                      grade: 'A',
                      semester: 'Fall 2023',
                      status: 'T'))
                },
                icon: const Icon(Icons.add),
              ),
              // Search Bar --------------------------------------------------
              // Container(
              //   height: 45,
              //   alignment: Alignment.topRight,
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 40,
              //     vertical: 5,
              //   ),
              //   margin: EdgeInsets.zero,
              //   constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
              //   child: TextField(
              //     onChanged: searchCourses,
              //     style: const TextStyle(
              //       color: Colors.white,
              //       decoration: TextDecoration.none,
              //       fontSize: 20,
              //     ),
              //     decoration: const InputDecoration(
              //       suffixIcon: Icon(Icons.search, color: Colors.white),
              //       hintText: 'Search...',
              //       hintStyle: TextStyle(
              //         color: Colors.white,
              //         decoration: TextDecoration.none,
              //         fontSize: 20,
              //       ),
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(width: 3, color: Colors.white),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //           borderSide:
              //               BorderSide(width: 3, color: Color(0xFFda6237))),
              //     ),
              //   ),
              // ),
            ]),
            // const SizedBox(height: 20),
            Row(mainAxisSize: MainAxisSize.min, children: [
              Expanded(
                child: FutureBuilder<List<CourseHistory>>(
                    future: courseHistory,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SingleChildScrollView(
                        controller: ScrollController(),
                        child: DataTable(
                          headingRowHeight: 80,
                          headingTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          dataRowHeight: 60,
                          dataTextStyle: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 25,
                          ),
                          columns: const [
                            DataColumn(label: Text('Course ID')),
                            DataColumn(label: Text('Course Name')),
                            DataColumn(label: Text('Semester')),
                            DataColumn(label: Text('Grade')),
                            DataColumn(label: Text('Status')),
                          ],
                          rows: List<DataRow>.generate(
                              growable: true,
                              snapshot.data!.length,
                              (int index) => DataRow(cells: <DataCell>[
                                    DataCell(
                                        Text(snapshot.data![index].courseid)),
                                    DataCell(
                                        Text(snapshot.data![index].coursename)),
                                    DataCell(
                                        Text(snapshot.data![index].semester)),
                                    DataCell(Text(snapshot.data![index].grade
                                        .toString())),
                                    DataCell(
                                        Text(snapshot.data![index].status)),
                                  ])),
                        ),
                      );
                    }),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  // these are the event handler for searching and filtering courses...will figure this out later
  searchCourses(String text) async {}
}
