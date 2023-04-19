import 'package:flutter/material.dart';
import '../main.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen();

  @override
  State<StatefulWidget> createState() => TransferScreenState();
}

class TransferScreenState extends State<TransferScreen> {
  TransferScreenState();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF3956F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      endDrawer: sideMenu(context),
      body: Row(
        //needs to ask for what the class transfers for so it works with the algorithm
        children: <Widget>[],
      ),
    );
  }
}
