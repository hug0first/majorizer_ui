import 'package:flutter/material.dart';
import '../api.dart';
import '../models/models.dart';
import '../widgets/datatable_page.dart';
import '../widgets/department.dart';
import 'department_screen.dart';

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

class CourseListItem extends StatelessWidget {
  final String iD;
  final String semOffered;
  final String name;
  final String description;
  final String credits;
  final String commPoints;
  final String instructor;
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
          side: const BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
        title: SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    constraints: const BoxConstraints(minWidth: 150),
                    child: buildTextItem(context, iD)),
                Container(
                    constraints: const BoxConstraints(minWidth: 400),
                    child: buildTextItem(context, name)),
                Container(
                    constraints: const BoxConstraints(minWidth: 150),
                    child: buildTextItem(context, credits)),
                Container(
                    constraints: const BoxConstraints(minWidth: 300),
                    child: buildTextItem(context, commPoints)),
                Container(
                    constraints: const BoxConstraints(minWidth: 250),
                    child: buildTextItem(context, semOffered)),
              ],
            )),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
        iconColor: Theme.of(context).colorScheme.onPrimary,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Text(
                      'Instructor: $instructor',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Course Description:\n$description',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
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
        color: Theme.of(context).colorScheme.onPrimary,
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
