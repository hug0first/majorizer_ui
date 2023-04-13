import 'dart:html';
import 'package:flutter/material.dart';
import 'main_app_bar.dart';
import 'side_menu.dart';

class AdminAdvisorScreen extends StatefulWidget {
  const AdminAdvisorScreen();

  @override
  State<AdminAdvisorScreen> createState() => AdminAdvisorScreenState();
}

class AdminAdvisorScreenState extends State<AdminAdvisorScreen>{
  // These are temporary values until the backend/database connection is made
  final advisors = ['unassigned', 'Sean Banerjee', 'Chuck Thorpe'];
  final unassigned = ['Robert Licata', 'hello', 'hello1'];
  final students_1 = ['Peter Dorovitsine', 'Sangwon Youn'];
  final students_2 = ['Niall Pepper', 'Tyler Yankee'];

  final depts = ['Computer Science', 'Computer Science'];
  final roles = ['Research', 'Academic'];
  final emails = ['sbanerje@clarkson.edu', 'cthorpe@clarkson.edu'];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var selected_value;
  var selected_list = [];
  var selected_length = 0;

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
              child: const Text('Advisor Manager: Administrator',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFFda6237),
                      fontFamily: 'Montserrat'))),
          Flexible(
              child: Container(
            height: 50,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 40),
            child: DropdownButton(
              hint: Text('choose the advisor'),
              value: selected_value,
              items: advisors.map((value){
                return DropdownMenuItem(value:value, child: Text(value));
              }).toList(),
              onChanged: (nvalue){
                print(nvalue);
                if (nvalue == 'unassigned') {
                  selected_list=unassigned;
                  selected_length=unassigned.length;
                }
                else if (nvalue == 'Sean Banerjee') {
                  selected_list=students_1;
                  selected_length=students_1.length;
                }
                else {
                  selected_list=students_2;
                  selected_length=students_2.length;
                }

                setState(() {
                  selected_value = nvalue!;
                });
              }
            )
          )),
          
          Container(width: 1250, child: const Divider(color: Colors.grey)),

          Flexible(
            child: ListView.builder(
                itemCount: selected_length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    alignment: Alignment.bottomLeft,
                    child: Row(children: <Widget>[
                      const Spacer(flex: 1),
                      Expanded(flex: 2, child: Text(selected_list[index])),
                    ]),
                  );
                }),
          ),

        ]));

        
  }
}

class AdminBuildScreen extends StatelessWidget {
  const AdminBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
