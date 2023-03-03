import 'package:flutter/material.dart';
import '../main.dart';
import 'side_menu.dart';
import 'main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

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
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Welcome, $firstName!',
                  style: const TextStyle(
                    //still need to add Montserrat into the pubspec.yaml file or whatever else it needs to show up
                    //it will not break without it, it just will be in a defualt font
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 96,
                    fontFamily: 'Montserrat',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 675,
                height: 450,
                child: Image.asset('assets/images/man_holding_laptop_art.png'),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: SizedBox(
              height: 400,
              width: 600,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  '''
                Current Major(s):
                Computer Science
  
                Current Minor(s):
                Psychology
  
                ''',
                  style: TextStyle(
                    fontSize: 48,
                    color: Color(0xFFda6237),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
