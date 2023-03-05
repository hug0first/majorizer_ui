import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/main_app_bar.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    Widget title = const Padding(
      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
      child: Text('Course Catalog'),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      body: Column(
        children: [
          title,
          CourseDatabase(),
        ],
      ),
    );
  }
}

class CourseDatabase extends StatelessWidget {
  CourseDatabase({super.key});
  final List<String> _tempCourseIDs = [
    'CS 141',
    'CS 142',
    'CS 241',
    'CS 242',
    'CS 341',
    'CS 344',
  ];
  final List<String> _tempCredits = [
    '4',
    '3',
    '3',
    '3',
    '3',
    '3',
  ];
  final List<String> _tempSemestersOffered = [
    'Every Semester',
    'Every Semester',
    'Spring Only',
    'Fall Only',
    'Fall Only',
    'Spring Only',
  ];
  final List<String> _tempNames = [
    'Introduction to Computer Science I',
    'Introduction to Computer Science II',
    'Computer Organization',
    'Advanced Programming Concepts In Java',
    'Programming Languages',
    'Algorithms and Data Structures',
  ];
  final List<String> _tempDescriptions = [
    'This course is an introduction to basic concepts of computer science, with emphasis on programming. Computer programming is to the study of computer science what writing is to the study of literature. It is a primary tool for implementing algorithms in computer science. Fundamental techniques for software design and implementation will be covered and these concepts demonstrated in a programming language like C++. Additional topics include top-down modular design, developing general-purpose software tools, procedural and data abstraction, algorithms, and an introduction to recursion and dynamic data structures. The course consists of three hours of lecture and a one hour computer laboratory session per week.',
    'This course will further develop and expand upon the topics introduced in CS 141. Advanced programming techniques will be covered, with extensive use of recursion and dynamic data structures. Abstract data types, including lists, queues, trees and graphs, will be studied. Specific emphasis will be given to tree traversals and binary search trees. Algorithms for searching and sorting will be explored along with methods of comparative analysis. The topics in this course provide an essential foundation for the further study of computer science.',
    'An introduction to computer organization and assembly language programming. Topics include the functional organization of computer hardware; data representation, and computer arithmetic; instruction sets, addressing modes and low-level I/O. Introduces machine and assembly language, and systems programming techniques in the programming language C. This course serves as a foundation for courses on operating systems, compilers, networks, and computer artchitecture.',
    'This course builds upon the foundation topics covered in CS 142, and covers concepts and skills required for real-life, modern programming. Topics will include basic object-oriented programming design, graphical user interfaces (GUIs), exception handling, multithreading and synchronization, networking, and client/server applications. The programming language Java with its companion OOP/GUI libraries will be used to illustrate these topics. This course will emphasize team programming on a large-scale project with a realistic deadline.',
    'This course examines the major paradigms underlying modern programming languages. The course currently focuses on object-oriented and logic programming. The rationale of the paradigms is discussed along with typical programming idioms used with them. Programming exercises are used to illustrate concepts--the course does not aim to make students proficient programmers in all the languages that will be studied.',
    'The primary goal of this course is to build on the programming skills gained in CS 141 and 142 to introduce students to more sophisticated algorithms and data structures and the notion of algorithm design. The course also introduces the basic formalism and concepts used in the analysis of algorithms. The relative efficiency of the algorithms studied is estimated by informal application of these ideas. The algorithms and data structures discussed include those for sorting and searching, pattern matching, set representation, graph problems, dynamic programming and others. Programming exercises based on \'realistic\' applications help students to understand the often difficult process of reducing a real-world problem to a standard algorithmic question.',
  ];
  // TODO: Implement... final List<String> _tempCommPoints = [];
  final List<String> _tempDesignation = [
    'CS',
    'CS',
    'CS',
    'CS',
    'CS',
    'CS',
  ];
  final List<String> _tempInstructorID = [''];

  final List<DataColumn> _columns = const [
    DataColumn(
      label: Expanded(
        child: Text(
          'Course ID',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Course',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Credits',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    DataColumn(
      label: Expanded(
        child: Text(
          'Semesters Offered',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _columns,
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Intro to Software Design and Development')),
            DataCell(Text('CS 141')),
            DataCell(Text('CS 141')),
            DataCell(Text('CS 141')),
          ],
        ),
      ],
    );
  }
}
