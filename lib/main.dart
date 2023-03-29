import 'package:flutter/material.dart';
import 'screens/schedule_builder/advisor_build_screen.dart';
import 'screens/courses/pages/catalog_screen.dart';
import 'screens/courses/pages/course_manager_screen.dart';
import 'screens/courses/pages/history_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/auth/pages/sign_up_form.dart';
import 'screens/home/landing_screen.dart';
import 'screens/schedule_builder/pages/student_build_screen.dart';
import 'screens/student_manager/pages/student_manager_screen.dart';
import 'screens/admin/pages/admin_advisor_screen.dart';

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
        '/home': (context) => HomeScreen(),
        '/landing': (context) => const LandingScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/studentBuild': (context) => const StudentBuildScreen(),
        '/history': (context) => const HistoryScreen(),
        '/advisorManager': (context) => AdvisorManagerScreen(),
        //'/advisorBuild': (context) => const AdvisorBuildScreen(),
        '/studentManager': (context) => StudentManagerScreen(),
        '/courseManager': (context) => const CourseManagerScreen(),
        '/adminAdvisor': (context) => const AdminAdvisorScreen(),
      },
      initialRoute: '/landing',
    );
  }
}
