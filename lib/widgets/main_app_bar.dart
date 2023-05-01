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
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.secondary,
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
    title: Text(
      "Majorizer",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary,
        /*shadows: <Shadow>[
          Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 3.0,
            color: Theme.of(context).colorScheme.onBackground
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
            child: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
                /*shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Theme.of(context).colorScheme.onBackground
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
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.secondary,
              /*shadows: <Shadow>[
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 5.0,
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ],*/
            ),
          ),
        ),
      ),
    ],
  );
}
