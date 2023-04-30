import 'package:flutter/material.dart';
import 'package:majorizer_ui/widgets/add_transfer_page.dart';
import 'widgets/course_manager_screen.dart';
import 'widgets/home_screen.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/landing_screen.dart';
//import 'widgets/student_build_screen.dart';
import 'screens/screens.dart';
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

String currMajor = (currMajors.isNotEmpty) ? currMajors[0] : '';
String currMajor2 = (currMajors.length >= 2) ? currMajors[1] : '';
String currMinor = (currMinors.isNotEmpty) ? currMinors[0] : '';
String currMinor2 = (currMinors.length >= 2) ? currMinors[1] : '';

class Majorizer extends StatelessWidget {
  Majorizer();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
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
        '/advisorManager': (context) => const AdvisorScreen(),
        //'/advisorBuild': (context) => const AdvisorBuildScreen(),
        '/studentManager': (context) => const StudentManagerScreen(),
        '/courseManager': (context) => const CourseManagerScreen(),
        '/adminAdvisor': (context) => const AdminAdvisorScreen(),
        '/addTransfer': (context) => TransferScreen(),
        '/logIn': (context) => const LoginPage()
      },
      initialRoute: '/landing',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF3956F),
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
          dataTableTheme: const DataTableThemeData(
            headingRowHeight: 80,
            headingTextStyle: TextStyle(
              color: Color(0xFFda6237),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            dataRowHeight: 60,
            dataTextStyle: TextStyle(
              color: Color(0xFF000000),
              fontSize: 25,
            ),
          )),
    );
  }
}
