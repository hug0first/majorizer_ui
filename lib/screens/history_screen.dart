import 'package:flutter/material.dart';
import '../api.dart';
import '../models/models.dart';
import '../widgets/datatable_page.dart';

class HistoryScreen extends StatefulWidget {
  final pageName = 'Course History';

  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  late Future<List<CourseHistory>> courseHistory;

  @override
  void initState() {
    super.initState();
    courseHistory = getCourseHistory();
  }

  @override
  Widget build(BuildContext context) {
    return DataTablePage(
      pageName: widget.pageName,
      pageBody: Row(mainAxisSize: MainAxisSize.min, children: [
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
                              DataCell(Text(snapshot.data![index].courseid)),
                              DataCell(Text(snapshot.data![index].coursename)),
                              DataCell(Text(snapshot.data![index].semester)),
                              DataCell(
                                  Text(snapshot.data![index].grade.toString())),
                              DataCell(Text(snapshot.data![index].status)),
                            ])),
                  ),
                );
              }),
        ),
      ]),
    );
  }

  // these are the event handler for searching and filtering courses...will figure this out later
  searchCourses(String text) async {}
}


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