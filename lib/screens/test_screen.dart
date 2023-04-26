import 'package:flutter/material.dart';
import 'package:majorizer_ui/models/models.dart';
import '../widgets/datatable_page.dart';
import '../models/student_advisors.dart';
import '../api.dart';

class AdvisorScreen extends StatefulWidget {
  const AdvisorScreen({super.key});

  @override
  State<AdvisorScreen> createState() => AdvisorScreenState();
}

class AdvisorScreenState extends State<AdvisorScreen> {
  late Future<List<StudentAdvisors>> studentAdvisors;

  @override
  void initState() {
    super.initState();
    studentAdvisors = getStudentAdvisors();
  }

  @override
  Widget build(BuildContext context) {
    return DataTablePage(
      pageName: 'Advisors',
      pageBody: Row(mainAxisSize: MainAxisSize.min, children: [
        Expanded(
          child: FutureBuilder<List<StudentAdvisors>>(
              future: studentAdvisors,
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
