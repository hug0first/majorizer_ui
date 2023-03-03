import 'package:flutter/material.dart';
import '../main.dart';

Widget sideMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFFda6237),
          ),
          child: Text(
            'Majorizer Navigation', //Temporary title
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.message),
          title: const Text(
            'Advisor Manager',
            style: TextStyle(color: Color(0xFFda6237)),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/advisorManager');
          },
        ),
        ListTile(
          //leading: Icon(Icons.account_circle),
          title: const Text(
            'History',
            style: TextStyle(
              color: Color(0xFFda6237),
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/history');
          },
        ),
        ListTile(
          title: const Text(
            'Schedule Builder',
            style: TextStyle(color: Color(0xFFda6237)),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/studentBuild');
          },
        ),
      ],
    ),
  );
}
