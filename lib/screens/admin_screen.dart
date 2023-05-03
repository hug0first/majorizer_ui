import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api.dart';
import '../models/models.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/side_menu.dart';

class AdminScreen extends StatefulWidget {
  final String pageName = 'Admin Dashboard';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  StudentAdvisors? selectedAdvisor; //TODO change to Advisor
  List<bool> selectedLists = <bool>[true, false]; // [advisors, students]
  List<Widget> selectedWidgets = [
    AdvisorTable(),
    Placeholder()
  ]; // TODO IMPLEMENT
  late Widget selectedWidget = selectedWidgets[1];
  late Future<List<Advisor>> advisors;

  @override
  void initState() {
    super.initState();

    //advisors = getAdvisors();
    //studentAdvisors = getStudentAdvisors();
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.pageName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 50,
                        ),
                      ),
                      ToggleButtons(
                        direction: Axis.horizontal,
                        isSelected: selectedLists,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.6),
                        selectedColor:
                            Theme.of(context).colorScheme.onBackground,
                        color: Theme.of(context).colorScheme.onBackground,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                        borderColor: Theme.of(context).colorScheme.primary,
                        selectedBorderColor:
                            Theme.of(context).colorScheme.primary,
                        borderWidth: 3,
                        borderRadius: BorderRadius.circular(8),
                        constraints: const BoxConstraints(
                          minHeight: 50.0,
                          minWidth: 100.0,
                        ),
                        children: const [
                          Text('Advisors'),
                          Text('Students'),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < selectedLists.length; i++) {
                              selectedLists[i] = i == index;
                            }
                          });
                        },
                      )
                    ]),
                const SizedBox(height: 10),
                selectedWidgets[selectedLists.indexOf(true)],
              ])),
        ));
  }
}

class AdvisorTable extends StatefulWidget {
  const AdvisorTable({super.key});

  @override
  State<AdvisorTable> createState() => _AdvisorTableState();
}

class _AdvisorTableState extends State<AdvisorTable> {
  late Future<List<StudentAdvisors>> studentAdvisors;
  final int _highlightIndex = 1;
  List<bool> _view = <bool>[false, false, true];

  @override
  void initState() {
    super.initState();
    studentAdvisors = getStudentAdvisors();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          width: 5,
        ),
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Students Lacking Advisors',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.add),
                      splashRadius: 25,
                      onPressed: () {}),
                ],
              )),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        headingTextStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        columns: const [
                          DataColumn(label: Text('First Name')),
                          DataColumn(label: Text('Last Name')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Department')),
                          DataColumn(label: Text('Profile')),
                          DataColumn(label: Text('Edit Advisees')),
                        ],
                        rows: List<DataRow>.generate(
                            growable: true,
                            snapshot.data!.length,
                            (int index) => DataRow(cells: <DataCell>[
                                  DataCell(Text(snapshot.data![index].fname)),
                                  DataCell(Text(snapshot.data![index].lname)),
                                  DataCell(InkWell(
                                      child: Text(
                                          snapshot.data![index].emailaddress),
                                      onTap: () => launchUrl(Uri(
                                            scheme: 'mailto',
                                            path: snapshot
                                                .data![index].emailaddress,
                                          )))),
                                  DataCell(Text(
                                      snapshot.data![index].advisingcapacity)),
                                  DataCell(SizedBox.expand(
                                      child: MaterialButton(
                                          child: const Icon(Icons.person),
                                          onPressed: () {
                                            throw UnimplementedError();
                                          }))),
                                  DataCell(SizedBox.expand(
                                      child: MaterialButton(
                                          child: const Icon(Icons.edit),
                                          onPressed: () {
                                            AnimatedRoute(
                                                snapshot.data![index]);
                                          })))
                                ])),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AdvisorStudentTable extends StatelessWidget {
  final StudentAdvisors advisor;
  const AdvisorStudentTable({super.key, required this.advisor});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class AdvisorProfile extends StatefulWidget {
  final Advisor advisor;
  const AdvisorProfile({required this.advisor, super.key});

  @override
  State<AdvisorProfile> createState() => AdvisorProfileState();
}

class AdvisorProfileState extends State<AdvisorProfile> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class AnimatedRoute extends MaterialPageRoute {
  AnimatedRoute(StudentAdvisors advisor)
      : super(builder: (context) => AdvisorStudentTable(advisor: advisor));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
