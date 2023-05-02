import 'package:flutter/material.dart';
import '../api.dart';
import '../models/models.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/side_menu.dart';

class AdminScreen extends StatefulWidget {
  final String pageName = 'Admin Dashboard';
  const AdminScreen();

  @override
  State<AdminScreen> createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Advisor>> advisors;
  late Future<List<StudentAdvisors>> studentAdvisors;
  late Future<List<AdvisorStudents>> advisorStudents;

  @override
  void initState() {
    super.initState();
    advisors = getAdvisors();
    studentAdvisors = getStudentAdvisors();
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
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.85,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(35),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          // Title
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.pageName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 50,
              ),
            ),
          ]),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(
                    width: 5,
                  ),
                ),
                child: Column(children: [
                  Text(
                    'Students Lacking Advisors',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 30,
                    ),
                  ),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: DataTable(
                          showCheckboxColumn: true,
                          columns: const [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Another thing'))
                          ],
                          rows: [
                            DataRow(cells: <DataCell>[
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ]),
                          ],
                        ),
                      ),
                      // child: FutureBuilder<List<StudentAdvisors>>(
                      //     future: studentAdvisors,
                      //     builder: (context, snapshot) {
                      //       if (!snapshot.hasData) {
                      //         return const Center(
                      //           child: CircularProgressIndicator(),
                      //         );
                      //       }
                      //       return SingleChildScrollView(
                      //         controller: ScrollController(),
                      //         child: DataTable(
                      //           columns: const [
                      //             DataColumn(label: Text('First Name')),
                      //             DataColumn(label: Text('Last Name')),
                      //             DataColumn(label: Text('Email')),
                      //             DataColumn(label: Text('Advising Capacity')),
                      //           ],
                      //           rows: List<DataRow>.generate(
                      //               growable: true,
                      //               snapshot.data!.length,
                      //               (int index) => DataRow(cells: <DataCell>[
                      //                     DataCell(Text(
                      //                         snapshot.data![index].fname)),
                      //                     DataCell(Text(
                      //                         snapshot.data![index].lname)),
                      //                     DataCell(Text(snapshot
                      //                         .data![index].emailaddress)),
                      //                     DataCell(Text(snapshot
                      //                         .data![index].advisingcapacity)),
                      //                   ])),
                      //         ),
                      //       );
                      //     }),
                    ),
                  ]),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Text('Admin Dashboard'),
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
