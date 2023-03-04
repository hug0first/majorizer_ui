import 'package:flutter/material.dart';

Widget mainAppBar(BuildContext context, GlobalKey<ScaffoldState> currPageKey) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          iconSize: 35,
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          icon: const Icon(
            Icons.home,
            color: Color(0xFFda6237),
            /*shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 5.0,
                color: Color.fromARGB(80, 0, 0, 0),
              ),
            ],*/
          ),
        );
      },
    ),
    leadingWidth: 150,
    title: const Text(
      "Majorizer",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFda6237),
        /*shadows: <Shadow>[
          Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 3.0,
            color: Color.fromARGB(120, 0, 0, 0),
          ),
        ],*/
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 50),
        child: SizedBox(
          height: 0,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/landing');
            },
            child: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFFda6237),
                /*shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(120, 0, 0, 0),
                  ),
                ],*/
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 50),
        child: SizedBox(
          child: IconButton(
            onPressed: () {
              currPageKey.currentState?.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Color(0xFFda6237),
              /*shadows: <Shadow>[
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(120, 0, 0, 0),
                ),
              ],*/
            ),
          ),
        ),
      ),
    ],
  );
}
