import 'package:flutter/material.dart';

import 'size_config.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen();

  void navToSignUp(BuildContext context) {
    Navigator.of(context).pushNamed('/logIn');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 35,
              onPressed: () {
                Navigator.of(context).pushNamed('/landing');
              },
              icon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          },
        ),
        leadingWidth: 150,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: SizedBox(
              height: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      '/logInSimp'); //eventually should be changed to a separate Login page
                  //user is just making a new account every time they visit, essentially
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 50, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'Welcome to',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 5.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'Majorizer',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 126,
                              fontFamily: 'Montserrat',
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 5.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'Where you plan courses until graduation',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 5.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Image.asset(
                      'assets/images/man_holding_laptop_art.png',
                      alignment: Alignment.bottomLeft,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ConstrainedBox(
          // constraints: const BoxConstraints(maxWidth: 300, maxHeight: 70),
          //child: Expanded(
          Expanded(
            child: FractionallySizedBox(
              widthFactor: .6,
              heightFactor: .2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  //NOTE:
                  //Drop shadow for sign up button still needs to be implemented properly
                  //the boxShadow below is what I currently have, but I can't get it to not drop to the bottom of the window
                  /*boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  //offset: const Offset(0, )\,
                ),
              ],*/
                ),
                //padding: const EdgeInsets.fromLTRB(0, 0, 100, 250),
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 70,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      navToSignUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      elevation: 20,
                      shadowColor: const Color.fromARGB(120, 0, 0,
                          0), //still need to add shadow to this widget
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 44,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //  ),
        ],
      ),
      /*const Center(
        child: Align(
          alignment: Alignment(-.8, -.4),
          child: Text(
            'Majorizer',
            style: TextStyle(
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
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
