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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(28, 50, 28, 20),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Welcome, $firstName!',
                        style: const TextStyle(
                          //still need to add Montserrat into the pubspec.yaml file or whatever else it needs to show up
                          //it will not break without it, it just will be in a defualt font
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 148,
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
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
                    heightFactor: .8,
                    widthFactor: .7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Current Major(s):\nComputer Science",
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
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Expanded(
                  child: FractionallySizedBox(
                    heightFactor: .8,
                    widthFactor: .7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Current Minor(s):\nPsychology",
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
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              widthFactor: .2,
              heightFactor: .2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Another Widget to\ndisplay info on classes",
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
          ),
        ],
      ),
    );
  }
}
