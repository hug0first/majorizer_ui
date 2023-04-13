import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/main_app_bar.dart';
import 'package:majorizer_ui/widgets/side_menu.dart';

class CatalogScreen extends StatelessWidget {
  static const List<DeptListItem> items = [
    DeptListItem('AC', 'Accounting'),
    DeptListItem('AE', 'Aeronautical Engineering'),
    DeptListItem('AMST', 'American Studies'),
    DeptListItem('ANTH', 'Anthropology'),
    DeptListItem('ARTS', 'Visual and Performing Arts'),
    DeptListItem('AS', 'Air, Space, & Cyberspace'),
    DeptListItem('BIE', 'Bioethics'),
    DeptListItem('BR', 'Biomedical/Rehabilitation Engineering'),
    DeptListItem('BY', 'Biology'),
    DeptListItem('CE', 'Civil and Environmental Engineering'),
    DeptListItem('CH', 'Chemical Engineering'),
    DeptListItem('CM', 'Chemistry'),
    DeptListItem('COMM', 'Communication'),
    DeptListItem('CS', 'Computer Science'),
    DeptListItem('PY', 'Psychology'),
    DeptListItem('MA', 'Mathematics'),
  ];

  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Column(
        children: [
          CatalogTitle(),
          Container(
            height: 550,
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
      color: Color(0xFFF3956F),
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
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 20,
        ),
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
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(ProgramListBodyRoute(this));
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
              color: Colors.white,
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
  static List<CourseListItem> courses = [
    CourseListItem(
      iD: 'CS 1',
      semOffered: 'Transfer Credit Only',
      name: 'Computer Science Elective',
      description:
          'A college level course for which there is no comparable Clarkson '
          'course. Used for transfer credit only. Check with major department '
          'to determine whether credits count toward graduation.',
      credits: '2-4',
      commPoints: '-',
      designation: 'CS',
      instructor: 'None',
    ),
    CourseListItem(
      iD: 'CS 2',
      semOffered: 'Transfer Credit Only',
      name: 'Computer Science Elective',
      description:
          'A college level course for which there is no comparable Clarkson '
          'course. Used for transfer credit only. This course may be used to '
          'satisfy a Programming Foundation Curriculum Requirement.',
      credits: '2-4',
      commPoints: '-',
      designation: 'CS',
      instructor: 'None',
    ),
    CourseListItem(
      iD: 'CS 141',
      semOffered: 'Every Semester',
      name: 'Introduction to Computer Science I',
      description:
          'This course is an introduction to basic concepts of computer '
          'science, with emphasis on programming. Computer programming is to '
          'the study of computer science what writing is to the study of '
          'literature. It is a primary tool for implementing algorithms in '
          'computer science. Fundamental techniques for software design and '
          'implementation will be covered and these concepts demonstrated in a '
          'programming language like C++. Additional topics include top-down '
          'modular design, developing general-purpose software tools, '
          'procedural and data abstraction, algorithms, and an introduction '
          'to recursion and dynamic data structures. The course consists of '
          'three hours of lecture and a one hour computer laboratory session '
          'per week.',
      credits: '4',
      commPoints: '-',
      designation: 'CS',
      instructor: 'Chuck Thorpe',
    ),
    CourseListItem(
      iD: 'CS 142',
      semOffered: 'Every Semester',
      name: 'Introduction to Computer Science I',
      description: 'This course will further develop and expand upon the '
          'topics introduced in CS 141. Advanced programming techniques will '
          'be covered, with extensive use of recursion and dynamic data '
          'structures. Abstract data types, including lists, queues, trees '
          'and graphs, will be studied. Specific emphasis will be given to '
          'tree traversals and binary search trees. Algorithms for searching '
          'and sorting will be explored along with methods of comparative '
          'analysis. The topics in this course provide an essential foundation '
          'for the further study of computer science.',
      credits: '3',
      commPoints: '-',
      designation: 'CS',
      instructor: 'Alexis Maciel',
    ),
    CourseListItem(
      iD: 'CS 241',
      semOffered: 'Spring Only',
      name: 'Computer Organization',
      description:
          'An introduction to computer organization and assembly language '
          'programming. Topics include the functional organization of computer '
          'hardware; data representation, and computer arithmetic; instruction '
          'sets, addressing modes and low-level I/O. Introduces machine and '
          'assembly language, and systems programming techniques in the '
          'programming language C. This course serves as a foundation for '
          'courses on operating systems, compilers, networks, and computer '
          'artchitecture.',
      credits: '3',
      commPoints: '-',
      designation: 'CS',
      instructor: 'Chuck Thorpe',
    ),
  ];
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
  final String designation;
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
    required this.designation,
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
  ProgramListBodyRoute(DeptListItem item)
      : super(
          builder: (context) => DeptPage(
            item,
          ),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
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
