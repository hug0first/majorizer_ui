import 'package:flutter/material.dart';
import 'widgets/advisor_build_screen.dart';
import 'widgets/catalog_screen.dart';
import 'widgets/course_manager_screen.dart';
import 'widgets/history_screen.dart';
import 'widgets/home_screen.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/landing_screen.dart';
import 'widgets/student_build_screen.dart';
import 'widgets/student_manager_screen.dart';

void main() => runApp(const Majorizer());
String firstName = "";

class Majorizer extends StatelessWidget {
  const Majorizer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Majorizer',
      routes: {
        '/signUp': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/landing': (context) => const LandingScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/studentBuild': (context) => const StudentBuildScreen(),
        '/history': (context) => const HistoryScreen(),
        '/advisorManager': (context) => AdvisorManagerScreen(),
        //'/advisorBuild': (context) => const AdvisorBuildScreen(),
        '/studentManager': (context) => StudentManagerScreen(),
        '/courseManager': (context) => const CourseManagerScreen(),
      },
      initialRoute: '/landing',
    );
  }
}
