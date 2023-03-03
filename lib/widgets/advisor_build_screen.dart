import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class AdvisorManagerScreen extends StatelessWidget {
  AdvisorManagerScreen();

  // These are temporary values until the backend/database connection is made
  final advisors = ['Sean Banerjee', 'Chuck Thorpe'];
  final depts = ['Computer Science', 'Computer Science'];
  final roles = ['Research', 'Academic'];
  final emails = ['sbanerje@clarkson.edu', 'cthorpe@clarkson.edu'];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: mainAppBar(context, scaffoldKey),
        ),
        endDrawer: sideMenu(context),
        body: Column(children: [
          Container(
              height: 75,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 25, left: 40),
              margin: EdgeInsets.zero,
              child: const Text('Advisor Manager',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFFda6237),
                      fontFamily: 'Montserrat'))),
          Flexible(
              child: Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: Row(children: <Widget>[
              const Spacer(flex: 1),
              const Expanded(
                  flex: 2,
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  flex: 2,
                  child: Text('Department',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  flex: 2,
                  child: Text('Role',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const Expanded(
                  flex: 2,
                  child: Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ]),
          )),
          Container(width: 1250, child: const Divider(color: Colors.grey)),
          Flexible(
            child: ListView.builder(
                itemCount: advisors.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      const Spacer(flex: 1),
                      Expanded(flex: 2, child: Text(advisors[index])),
                      Expanded(
                          flex: 2,
                          child: Text(depts[index],
                              overflow: TextOverflow.ellipsis)),
                      Expanded(flex: 2, child: Text(roles[index])),
                      Expanded(flex: 2, child: Text(emails[index]))
                    ]),
                  );
                }),
          ),
        ]));
  }
}

class AdvisorBuildScreen extends StatelessWidget {
  const AdvisorBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
