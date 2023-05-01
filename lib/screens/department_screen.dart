import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/datatable_page.dart';
import '../widgets/department.dart';

class DepartmentScreen extends StatefulWidget {
  final Department selectedDepartment;
  const DepartmentScreen({super.key, required this.selectedDepartment});

  @override
  State<DepartmentScreen> createState() => DepartmentScreenState();
}

class DepartmentScreenState extends State<DepartmentScreen> {
  late Department _selectedDepartment;

  @override
  void initState() {
    super.initState();
    _selectedDepartment = widget.selectedDepartment;
  }

  @override
  Widget build(BuildContext context) {
    return DataTablePage(
      pageName: _selectedDepartment.name,
      pageBody: Column(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 50,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //border:
            //Border.all(color: const Theme.of(context).colorScheme.primary, width: 4),
            color: Colors.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    constraints: const BoxConstraints(minWidth: 150),
                    child: buildColumnLabel(context, 'Course ID')),
                Container(
                    constraints: const BoxConstraints(minWidth: 400),
                    child: buildColumnLabel(context, 'Course Title')),
                Container(
                    constraints: const BoxConstraints(minWidth: 150),
                    child: buildColumnLabel(context, 'Credits')),
                Container(
                    constraints: const BoxConstraints(minWidth: 300),
                    child: buildColumnLabel(context, 'Comm Points')),
                Container(
                    constraints: const BoxConstraints(minWidth: 250),
                    child: buildColumnLabel(context, 'Term')),
              ]),
        ),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85 - 220,
            width: MediaQuery.of(context).size.width * 0.85 - 80,
            alignment: Alignment.bottomCenter,
            child: ListView.builder(
                itemCount: _selectedDepartment.courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: _selectedDepartment.courses[index]);
                }),
          ),
        ]),
      ]),
    );
  }

  Widget buildColumnLabel(BuildContext context, String label) {
    return Text(
      label,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final CourseCatalog course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        childrenPadding: const EdgeInsets.only(bottom: 15),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    constraints: const BoxConstraints(minWidth: 150),
                    child: buildTextItem(context, course.courseid)),
                Container(
                    constraints: const BoxConstraints(minWidth: 400),
                    child: buildTextItem(context, course.coursename)),
                Container(
                    constraints: const BoxConstraints(minWidth: 150),
                    child: buildTextItem(context, course.credits.toString())),
                Container(
                    constraints: const BoxConstraints(minWidth: 300),
                    child:
                        buildTextItem(context, course.commpoints.toString())),
                Container(
                    constraints: const BoxConstraints(minWidth: 250),
                    child: buildTextItem(context, course.semestersoffered)),
              ],
            )),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        collapsedIconColor: Colors.white,
        iconColor: Theme.of(context).colorScheme.background,
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
                      'Instructor: ${course.instructorname}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Course Description:\n${course.description}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onBackground,
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
