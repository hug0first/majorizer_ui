import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api.dart';
import '../models/models.dart';
import '../widgets/datatable_page.dart';

class AdvisorScreen extends StatefulWidget {
  final pageName = 'Advisors';

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
      pageName: widget.pageName,
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
                              DataCell(InkWell(
                                  child:
                                      Text(snapshot.data![index].emailaddress),
                                  onTap: () => launchUrl(Uri(
                                        scheme: 'mailto',
                                        path:
                                            snapshot.data![index].emailaddress,
                                      )))),
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

class AdvisorBuildScreen extends StatelessWidget {
  const AdvisorBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
