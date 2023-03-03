import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class StudentBuildScreen extends StatelessWidget {
  const StudentBuildScreen();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF3956F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: const Center(
        child: SizedBox(
          child: Text("schedule builder needs to be implemented"),
        ),
      ),
    );
  }
}
