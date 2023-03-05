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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 95),
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
              Stack(
                children: <Widget>[
                  Positioned(
                    //left: 0.0,
                    //bottom: 108.0,
                    child: SizedBox(
                      width: 500,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                        child: const Text(
                          '''
Current Major(s):
Computer Science


Current Minor(s):
Psychology 

                ''',
                          style: TextStyle(
                            color: Color(0xFFda6237),
                            fontSize: 42.0,
                            fontWeight: FontWeight.w500,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  child: const Text(
                    '''
Another Widget to 
display info on classes
                ''',
                    style: TextStyle(
                        color: Color(0xFFda6237),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
