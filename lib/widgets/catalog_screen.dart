import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/main_app_bar.dart';
import 'package:majorizer_ui/widgets/side_menu.dart';

class CatalogScreen extends StatelessWidget {
  static const List<DeptListItem> items = [
    DeptListItem('CS', 'Computer\nScience'),
    DeptListItem('CM', 'Chemistry'),
    DeptListItem('PY', 'Psychology'),
    DeptListItem('MA', 'Mathematics'),
  ];

  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF3956F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      body: Column(
        children: [
          CatalogTitle(),
          Divider(
            color: Colors.white,
            thickness: 4,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            child: DeptList(
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogTitle extends StatelessWidget {
  const CatalogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Course Catalog',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Flexible(child: search(context)),
        ],
      ),
    );
  }

  Widget search(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 100),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search Courses',
          hintStyle: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xFFda6237)),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          focusColor: Color(0xFFda6237),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
          ),
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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(ProgramListBodyRoute(this));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(180),
            color: Color(0xFFF3956F),
            border: Border.all(
              color: Colors.white,
              width: 8,
            ),
          ),
          child: Column(
            children: [
              buildID(context),
              buildName(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildID(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
      child: Text(
        programID,
        style: const TextStyle(
          decoration: TextDecoration.none,
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildName(BuildContext context) {
    return Text(
      programName,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}

class DeptPage extends StatelessWidget {
  final DeptListItem item;
  static List<CourseListItem> courses = [
    CourseListItem(
      iD: 'ID',
      semOffered: 'Sem',
      name: 'NamesadfasdfasdfS',
      description: 'Description',
      credits: 'Credits',
      commPoints: 'Comm Points',
      designation: 'Designation',
      instructor: 'Instructor',
    ),
    CourseListItem(
      iD: 'ID',
      semOffered: 'Sem',
      name: 'Name',
      description: 'Description',
      credits: 'Credits',
      commPoints: 'Comm Points',
      designation: 'Designation',
      instructor: 'Instructor',
    ),
    CourseListItem(
      iD: 'ID',
      semOffered: 'Sem',
      name: 'Name',
      description: 'Description',
      credits: 'Credits',
      commPoints: 'Comm Points',
      designation: 'Designation',
      instructor: 'Instructor',
    ),
  ];
  const DeptPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFFda6237),
        title: Text(item.programName),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFF3956F),
      body: Hero(
        tag: item.programID,
        flightShuttleBuilder:
            (flightContext, animation, direction, fromContext, toContext) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Color(0xFFF3956F),
              border: Border.all(
                width: 6,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.programID + ' - ' + item.programName,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 400, maxHeight: 100),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Courses',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 20,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFda6237)),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          focusColor: Color(0xFFda6237),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 4,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              height: 500,
              child: ListView(
                children: courses,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
            ),
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
  final String designation;
  final String instructor;
  final TextStyle itemStyle = const TextStyle(
    decoration: TextDecoration.none,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  const CourseListItem({
    super.key,
    required this.iD,
    required this.semOffered,
    required this.name,
    required this.description,
    required this.credits,
    required this.commPoints,
    required this.designation,
    required this.instructor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFF3956F),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              iD + ': ' + name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              credits,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              semOffered,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              commPoints,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              instructor,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.description),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgramListBodyRoute extends MaterialPageRoute {
  ProgramListBodyRoute(DeptListItem item)
      : super(
          builder: (context) => DeptPage(
            item,
          ),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class DeptList extends StatelessWidget {
  final List<DeptListItem> items;
  const DeptList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: items,
    );
  }
}
