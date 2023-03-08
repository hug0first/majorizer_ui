import 'package:flutter/material.dart';
import 'main_app_bar.dart';

Widget scheduleRow(String time, String sunday, String monday, String tuesday,
    String wednesday, String thursday, String friday, String saturday) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          time,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          sunday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          monday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          tuesday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          wednesday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          thursday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          friday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          saturday,
          style: const TextStyle(
            color: Color(0xFFda6237),
            fontSize: 42.0,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
      ),
    ],
  );
}

class classScheduleTemp extends StatelessWidget {
  classScheduleTemp();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //replace build with classSchedule and get rid of scaffold
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: mainAppBar(context, scaffoldKey),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(
            width: 1250,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                child: scheduleRow("Time", "Sunday", "Monday", "Tuesday",
                    "Wednesday", "Thursday", "Friday", "Saturday")),
          ),
          const Padding(padding: EdgeInsets.only(top: 25)),
          SizedBox(
            width: 1250,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
              child: Column(
                children: <Widget>[],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
