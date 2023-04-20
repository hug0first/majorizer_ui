import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/add_transfer_page.dart';
import 'package:majorizer_ui/widgets/catalog_map.dart';
import 'screens/advisor_build_screen.dart';
import 'screens/catalog_screen.dart';
import 'widgets/course_manager_screen.dart';
import 'screens/history_screen.dart';
import 'widgets/home_screen.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/landing_screen.dart';
//import 'widgets/student_build_screen.dart';
import 'screens/student_manager_screen.dart';
import 'widgets/admin_advisor_screen.dart';
import 'widgets/new_build_screen.dart';
import 'widgets/log_in_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Firebase 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Majorizer());
}

String firstName = "";
String lastName = "";
String emailAdrs = "";
List<String> currMajors = ['Computer Science'];
List<String> currMinors = ['Psychology'];

String currMajor = 'Computer Science';
String currMajor2 = '';
String currMinor = 'Psychology';
String currMinor2 = '';

class Majorizer extends StatelessWidget {
  Majorizer();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    CatalogMap().initMap();
    return MaterialApp(
      navigatorKey: navigatorKey,
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
        '/adminAdvisor': (context) => const AdminAdvisorScreen(),
        '/addTransfer': (context) => TransferScreen(),
        '/logIn': (context) => const LoginPage()
      },
      initialRoute: '/landing',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFF3956F),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFda6237),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFFB00020),
          onError: Color(0xFFFFFFFF),
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFF000000),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
