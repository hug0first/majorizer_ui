import 'package:flutter/material.dart';
import '../main.dart';
import 'major_minor_list.dart';
import 'side_menu.dart';
import 'main_app_bar.dart';

var majorTitleTextController = TextEditingController();
var minorTitleTextController = TextEditingController();

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState();

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
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(28, 50, 28, 50),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        'Welcome, $firstName!',
                        style: TextStyle(
                          //still need to add Montserrat into the pubspec.yaml file or whatever else it needs to show up
                          //it will not break without it, it just will be in a defualt font
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 10,
                          fontFamily: 'Montserrat',
                          shadows: const <Shadow>[
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: FractionallySizedBox(
                        widthFactor: 1.3,
                        child: Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding:
                              const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: screenHeight * .6,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Current Major(s)",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: const Color(0xFFda6237),
                                        fontSize: screenWidth / 32,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4.5,
                                      child: const Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth / 3.3,
                                      height: screenHeight / 8,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                height: screenHeight * .01),
                                        itemCount: currMajors.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: const Icon(
                                                Icons.library_books_outlined),
                                            title: Text(
                                              currMajors[index],
                                              style: TextStyle(
                                                fontSize: screenWidth / 50,
                                              ),
                                            ),
                                            trailing: IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () {
                                                setState(() {
                                                  majorListTiles.add(ListTile(
                                                    leading: Text(
                                                      currMajors[index],
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              60),
                                                    ),
                                                    trailing: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          currMajors.add(
                                                              currMajors[
                                                                  index]);
                                                        });
                                                      }, //add a new major from a search bar
                                                      icon:
                                                          const Icon(Icons.add),
                                                      color: const Color(
                                                          0xFFda6237),
                                                      style:
                                                          IconButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                    ),
                                                  ));
                                                  currMajors.removeAt(index);
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Add A Major",
                                          style: TextStyle(
                                            fontSize: screenWidth / 60,
                                            color: const Color(0xFFda6237),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.5,
                                          child: const Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          child: ListView(
                                            //children: MajorMinorList().possibleMajorListTiles(),
                                            children: possibleMajorListTiles(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: screenWidth * .05)),
                    Expanded(
                      flex: 3,
                      child: FractionallySizedBox(
                        widthFactor: 1.3,
                        child: Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding:
                              const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: screenHeight * .6,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Current Minor(s)",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: const Color(0xFFda6237),
                                        fontSize: screenWidth / 32,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth / 4.5,
                                      child: const Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth / 3.3,
                                      height: screenHeight / 8,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                height: screenHeight * .01),
                                        itemCount: currMinors.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: const Icon(
                                                Icons.library_books_outlined),
                                            title: Text(
                                              currMinors[index],
                                              style: TextStyle(
                                                fontSize: screenWidth / 50,
                                              ),
                                            ),
                                            trailing: IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () {
                                                setState(() {
                                                  minorListTiles.add(ListTile(
                                                    leading: Text(
                                                      currMinors[index],
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              60),
                                                    ),
                                                    trailing: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          currMinors.add(
                                                              currMinors[
                                                                  index]);
                                                        });
                                                      }, //add a new minor from a search bar
                                                      icon:
                                                          const Icon(Icons.add),
                                                      color: const Color(
                                                          0xFFda6237),
                                                      style:
                                                          IconButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                    ),
                                                  ));
                                                  currMinors.removeAt(index);
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Add A Minor",
                                          style: TextStyle(
                                            fontSize: screenWidth / 60,
                                            color: const Color(0xFFda6237),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.5,
                                          child: const Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          child: ListView(
                                            children: possibleMinorListTiles(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: .65,
              heightFactor: .5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Current Courses",
                        style: TextStyle(
                          color: const Color(0xFFda6237),
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth / 30,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 4,
                        child: const Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                  courses[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth / 60,
                                    color: const Color(0xFFda6237),
                                  ),
                                ),
                                trailing: Text(
                                  titles[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth / 65,
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ListTile> majorListTiles = [];
  List<ListTile> possibleMajorListTiles() {
    List<ListTile> majorListTiles = [];
    for (var major
        in MajorMinorList().possibleMajorList(currMajor, currMajor2)) {
      majorListTiles.add(ListTile(
        leading: Text(
          major,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 60),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              currMajors.add(major);
            });
          },
          icon: const Icon(Icons.add),
          color: const Color(0xFFda6237),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ));
    }
    return majorListTiles;
  }

  List<ListTile> minorListTiles = [];
  List<ListTile> possibleMinorListTiles() {
    List<ListTile> minorListTiles = [];
    for (var minor
        in MajorMinorList().possibleMinorList(currMinor, currMinor2)) {
      minorListTiles.add(ListTile(
        leading: Text(
          minor,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 60),
        ),
        trailing: IconButton(
          onPressed: () => addToCurrMinors(minor),
          icon: const Icon(Icons.add),
          color: const Color(0xFFda6237),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ));
    }
    return minorListTiles;
  }

  void addToCurrMajors(String major) {
    setState(() {
      currMajors.add(major);
    });
  }

  void addToCurrMinors(String minor) {
    setState(() {
      currMinors.add(minor);
    });
  }
}
