import 'package:flutter/material.dart';
import '../api.dart';
import '../models/models.dart';
import '../widgets/datatable_page.dart';

class StudentManagerScreen extends StatefulWidget {
  final pageName = 'Manage Students';

  const StudentManagerScreen({super.key});

  @override
  State<StudentManagerScreen> createState() => StudentManagerScreenState();
}

class StudentManagerScreenState extends State<StudentManagerScreen> {
  late Future<List<AdvisorStudents>> advisorStudents;

  @override
  void initState() {
    super.initState();
    advisorStudents = getAdvisorStudents();
  }

  @override
  Widget build(BuildContext context) {
    return DataTablePage(
      pageName: widget.pageName,
      pageBody: Row(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          child: FutureBuilder<List<AdvisorStudents>>(
              future: advisorStudents,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  controller: ScrollController(),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Last Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Advising Capacity')),
                    ],
                    rows: List<DataRow>.generate(
                        growable: true,
                        snapshot.data!.length,
                        (int index) => DataRow(cells: <DataCell>[
                              DataCell(Text(snapshot.data![index].fname)),
                              DataCell(Text(snapshot.data![index].lname)),
                              DataCell(
                                  Text(snapshot.data![index].emailaddress)),
                              DataCell(
                                  Text(snapshot.data![index].advisingcapacity)),
                            ])),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
