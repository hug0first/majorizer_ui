import 'package:flutter/material.dart';

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
          title: const Text(
            'Student Manager',
            style: TextStyle(color: Color(0xFFda6237)),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/studentManager');
          },
        ),
        ListTile(
          //leading: Icon(Icons.account_circle),
          title: const Text(
            'Course History',
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
        ListTile(
          title: const Text(
            'Course Catalog',
            style: TextStyle(color: Color(0xFFda6237)),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/catalog');
          },
        ),
        ListTile(
          title: const Text(
            'Admin Advisor View',
            style: TextStyle(color: Color(0xFFda6237)),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/adminAdvisor');
          },
        ),
      ],
    ),
  );
}
