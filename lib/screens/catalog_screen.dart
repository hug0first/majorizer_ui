import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../api.dart';
import '../models/models.dart';
import 'department_screen.dart';
import '../widgets/datatable_page.dart';
import '../widgets/department.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/side_menu.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  late Future<List<CourseCatalog>> courseCatalog;
  late Future<List<Department>> departments;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CatalogScreenState();

  @override
  void initState() {
    super.initState();
    courseCatalog = getCourseCatalog();
    departments = parseCatalog(courseCatalog);
  }

  @override
  Widget build(BuildContext context) {
    return DataTablePage(
      pageName: 'Course Catalog',
      pageBody: Expanded(
        child: FutureBuilder<List<Department>>(
            future: departments,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Error: No courses recieved.'),
                );
              }
              // departments = parseCatalog(snapshot.data!);
              return GridView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                children: [
                  for (Department dept in snapshot.data!)
                    DepartmentGridItem(department: dept)
                ],
              );
            }),
      ),
    );
  }
}

class DepartmentGridItem extends StatefulWidget {
  final Department department;

  const DepartmentGridItem({required this.department, super.key});

  @override
  State<DepartmentGridItem> createState() => DepartmentGridItemState();
}

class DepartmentGridItemState extends State<DepartmentGridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(ProgramListBodyRoute(widget.department));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 5,
        ),
        elevation: 5,
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.department.id,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 55,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                widget.department.name,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DeptListItem extends StatelessWidget {
  final String programID;
  final String programName;

  const DeptListItem(this.programID, this.programName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: programID,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.of(context).push(ProgramListBodyRoute(this));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF3956F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 5,
        ),
        child: Column(
          children: [
            buildID(context),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            buildName(context),
          ],
        ),
      ),
    );
  }

  Widget buildID(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          overflow: TextOverflow.visible,
          programID,
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 45,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }

  Widget buildName(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            programName,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 22,
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ],
    );
  }
}

class DeptPage extends StatelessWidget {
  final DeptListItem item;
  static List<CourseListItem> courses = [];
  const DeptPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      backgroundColor: Colors.white,
      body: Hero(
        tag: item.programID,
        flightShuttleBuilder:
            (flightContext, animation, direction, fromContext, toContext) {
          return Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFF3956F),
            ),
          );
        },
        child: Column(
          children: [
            // Title, Search, and Column Labels ----------------------------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              color: const Color(0xFFF3956F),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title -------------------------------------------------------
                      Expanded(
                        flex: 2,
                        child: Text(item.programName,
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
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFFda6237))),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //border:
                    //Border.all(color: const Color(0xFFF3956F), width: 4),
                    color: Colors.white,
                  ),
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              constraints: BoxConstraints(minWidth: 150),
                              child: buildColumnLabel(context, 'Course ID')),
                          Container(
                              constraints: BoxConstraints(minWidth: 400),
                              child: buildColumnLabel(context, 'Course Title')),
                          Container(
                              constraints: BoxConstraints(minWidth: 150),
                              child: buildColumnLabel(context, 'Credits')),
                          Container(
                              constraints: BoxConstraints(minWidth: 300),
                              child: buildColumnLabel(context, 'Comm Points')),
                          Container(
                              constraints: BoxConstraints(minWidth: 250),
                              child: buildColumnLabel(context, 'Term')),
                        ]),
                  ),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height: 550,
              child: ListView(
                children: courses,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
            ),
          ],
        ),
      ),
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

class CourseListItem extends StatelessWidget {
  final String iD;
  final String semOffered;
  final String name;
  final String description;
  final String credits;
  final String commPoints;
  final String instructor;
  static Color primaryColor = const Color(0xFFF3956F);
  static Color secondaryColor = const Color(0xFFFFFFFF);

  const CourseListItem({
    super.key,
    required this.iD,
    required this.semOffered,
    required this.name,
    required this.description,
    required this.credits,
    required this.commPoints,
    required this.instructor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        childrenPadding: const EdgeInsets.only(bottom: 15),
        collapsedShape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
        title: Container(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    constraints: BoxConstraints(minWidth: 150),
                    child: buildTextItem(context, iD)),
                Container(
                    constraints: BoxConstraints(minWidth: 400),
                    child: buildTextItem(context, name)),
                Container(
                    constraints: BoxConstraints(minWidth: 150),
                    child: buildTextItem(context, credits)),
                Container(
                    constraints: BoxConstraints(minWidth: 300),
                    child: buildTextItem(context, commPoints)),
                Container(
                    constraints: BoxConstraints(minWidth: 250),
                    child: buildTextItem(context, semOffered)),
              ],
            )),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        collapsedBackgroundColor: Color(0xFFF3956F),
        backgroundColor: Color(0xFFF3956F),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Text(
                      'Instructor: ' + instructor,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Color(0xFFF3956F),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Course Description:\n' + description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Color(0xFFF3956F),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

class ProgramListBodyRoute extends MaterialPageRoute {
  ProgramListBodyRoute(Department dept)
      : super(builder: (context) => DepartmentScreen(selectedDepartment: dept));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
