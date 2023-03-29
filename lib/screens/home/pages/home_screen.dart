import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../widgets/side_menu.dart';
import '../../widgets/main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

  final courses = ['CS 341', 'UNIV 190', 'MA 132', 'CM 131', 'PH 131'];
  final titles = [
    'Programming Languages',
    'The Clarkson Seminar',
    'Calculus II',
    'General Chemistry I',
    'Physics I'
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

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
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                      child: Text(
                        "Current Major(s):\nComputer Science",
                        style: TextStyle(
                          color: const Color(0xFFda6237),
                          fontSize: screenWidth / 30,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
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
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                      child: Text(
                        "Current Minor(s):\nPsychology",
                        style: TextStyle(
                          color: const Color(0xFFda6237),
                          fontSize: screenWidth / 30,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
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
              widthFactor: .65,
              heightFactor: .5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 0.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 20,
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Current Courses",
                              style: TextStyle(
                                color: const Color(0xFFda6237),
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth / 85,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                              child: ListView.builder(
                                  itemCount: courses.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 25,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Flexible(
                                                child: Text(courses[index],
                                                    style: const TextStyle(
                                                        fontSize: 7))),
                                            Flexible(
                                                child: Text(titles[index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 7)))
                                          ]),
                                    );
                                  }))
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
