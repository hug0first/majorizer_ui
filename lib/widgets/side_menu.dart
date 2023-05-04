import 'package:flutter/material.dart';

bool isAdmin = false;

Widget sideMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: const Text(
            'Majorizer Navigation', //Temporary title
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        !isAdmin
            ? ListTile(
                //leading: Icon(Icons.message),
                title: Text(
                  'Advisor Manager',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/advisorManager');
                },
              )
            : Container(),
        isAdmin
            ? ListTile(
                title: Text(
                  'Student Manager',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/studentManager');
                },
              )
            : Container(),
        ListTile(
          //leading: Icon(Icons.account_circle),
          title: Text(
            'Course History',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/history');
          },
        ),
        ListTile(
          title: Text(
            'Schedule Builder',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/studentBuild');
          },
        ),
        ListTile(
          title: Text(
            'Course Catalog',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/catalog');
          },
        ),
        ListTile(
          title: Text(
            'Admin Advisor View',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/adminAdvisor');
          },
        ),
        ListTile(
          title: Text(
            'Add Previously Taken Course',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/addTransfer');
          },
        ),
        ListTile(
          title: Text(
            'Administration',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/admin');
          },
        ),
      ],
    ),
  );
}
