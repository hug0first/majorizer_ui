import 'package:flutter/material.dart';
import 'package:majorizer_ui/api.dart';
import 'package:majorizer_ui/models/student_major.dart';
import 'package:majorizer_ui/models/student_minor.dart';
import '../main.dart';
import 'major_minor_list.dart';
import 'side_menu.dart';
import 'main_app_bar.dart';
import 'gpa_calc.dart';

var majorTitleTextController = TextEditingController();
var minorTitleTextController = TextEditingController();
late List<String> homeCurrMajors;
late List<String> homeCurrMinors;

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState();

  String gpa = 'N/A';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
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
                          shadows: <Shadow>[
                            Shadow(
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 5.0,
                              color: Theme.of(context).colorScheme.onBackground,
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
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
                                      height: screenHeight / 6,
                                      child: FutureBuilder(
                                          future: MajorMinorList()
                                              .getCurrMajorList()
                                              .then((value) =>
                                                  homeCurrMajors = value),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Container(
                                                width: screenWidth / 20,
                                                height: screenWidth / 20,
                                                alignment: Alignment.center,
                                                child: AspectRatio(
                                                  aspectRatio: 1 / 1,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                ),
                                              );
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.done) {
                                              if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else if (snapshot.hasData) {
                                                currMajors = homeCurrMajors;
                                                currMajor =
                                                    (currMajors.isNotEmpty)
                                                        ? currMajors[0]
                                                        : '';
                                                currMajor2 =
                                                    (currMajors.length >= 2)
                                                        ? currMajors[1]
                                                        : '';
                                                return ListView.separated(
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      SizedBox(
                                                          height: screenHeight *
                                                              .01),
                                                  itemCount: currMajors.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      leading: const Icon(Icons
                                                          .library_books_outlined),
                                                      title: Text(
                                                        currMajors[index],
                                                        style: TextStyle(
                                                          fontSize:
                                                              screenWidth / 60,
                                                        ),
                                                      ),
                                                      trailing: IconButton(
                                                        icon: const Icon(
                                                            Icons.delete),
                                                        onPressed: () {
                                                          setState(() {
                                                            majorListTiles
                                                                .add(ListTile(
                                                              leading: Text(
                                                                currMajors[
                                                                    index],
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        60),
                                                              ),
                                                              trailing:
                                                                  IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    currMajors.add(
                                                                        currMajors[
                                                                            index]);
                                                                  });
                                                                }, //add a new major from a search bar
                                                                icon: const Icon(
                                                                    Icons.add),
                                                                color: const Color(
                                                                    0xFFda6237),
                                                                style: IconButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ));
                                                            //currMajors.removeAt(
                                                            //  index);
                                                            deleteStudentMajor(
                                                                StudentMajor(
                                                                    studentid:
                                                                        'S0001',
                                                                    major: currMajors[
                                                                        index]));
                                                          });
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return const Text('Empty data');
                                              }
                                            } else {
                                              return Text(
                                                  'State: ${snapshot.connectionState}');
                                            }
                                          }),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Add A Major",
                                          style: TextStyle(
                                            fontSize: screenWidth / 60,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
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
                                              .21,
                                          child: FutureBuilder(
                                              future: MajorMinorList()
                                                  .getCurrMajorList(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Container(
                                                    width: screenWidth / 20,
                                                    height: screenWidth / 20,
                                                    alignment: Alignment.center,
                                                    child: AspectRatio(
                                                      aspectRatio: 1 / 1,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                      ),
                                                    ),
                                                  );
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.done) {
                                                  if (snapshot.hasError) {
                                                    return Text(
                                                        'Error: ${snapshot.error}');
                                                  } else if (snapshot.hasData) {
                                                    return ListView(
                                                      children:
                                                          possibleMajorListTiles(),
                                                    );
                                                  } else {
                                                    return const Text(
                                                        'Empty data');
                                                  }
                                                } else {
                                                  return Text(
                                                      'State: ${snapshot.connectionState}');
                                                }
                                              }),
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
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
                                      height: screenHeight / 6,
                                      child: FutureBuilder(
                                          future: MajorMinorList()
                                              .getCurrMinorList()
                                              .then((value) =>
                                                  homeCurrMinors = value),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Container(
                                                width: screenWidth / 20,
                                                height: screenWidth / 20,
                                                alignment: Alignment.center,
                                                child: AspectRatio(
                                                  aspectRatio: 1 / 1,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                ),
                                              );
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.done) {
                                              if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else if (snapshot.hasData) {
                                                currMinors = homeCurrMinors;
                                                currMinor =
                                                    (currMinors.isNotEmpty)
                                                        ? currMinors[0]
                                                        : '';
                                                currMinor2 =
                                                    (currMinors.length >= 2)
                                                        ? currMinors[1]
                                                        : '';
                                                return ListView.separated(
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      SizedBox(
                                                          height: screenHeight *
                                                              .01),
                                                  itemCount: currMinors.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      leading: const Icon(Icons
                                                          .library_books_outlined),
                                                      title: Text(
                                                        currMinors[index],
                                                        style: TextStyle(
                                                          fontSize:
                                                              screenWidth / 60,
                                                        ),
                                                      ),
                                                      trailing: IconButton(
                                                        icon: const Icon(
                                                            Icons.delete),
                                                        onPressed: () {
                                                          setState(() {
                                                            minorListTiles
                                                                .add(ListTile(
                                                              leading: Text(
                                                                currMinors[
                                                                    index],
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        60),
                                                              ),
                                                              trailing:
                                                                  IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    currMinors.add(
                                                                        currMinors[
                                                                            index]);
                                                                  });
                                                                },
                                                                icon: const Icon(
                                                                    Icons.add),
                                                                color: const Color(
                                                                    0xFFda6237),
                                                                style: IconButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ));
                                                            //currMinors.removeAt(
                                                            //  index);
                                                            deleteStudentMinor(
                                                                StudentMinor(
                                                                    studentid:
                                                                        'S0001',
                                                                    minor: currMinors[
                                                                        index]));
                                                          });
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return const Text('Empty data');
                                              }
                                            } else {
                                              return Text(
                                                  'State: ${snapshot.connectionState}');
                                            }
                                          }),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "Add A Minor",
                                          style: TextStyle(
                                            fontSize: screenWidth / 60,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
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
                                              .21,
                                          child: FutureBuilder(
                                              future: MajorMinorList()
                                                  .getCurrMinorList(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Container(
                                                    width: screenWidth / 20,
                                                    height: screenWidth / 20,
                                                    alignment: Alignment.center,
                                                    child: AspectRatio(
                                                      aspectRatio: 1 / 1,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                      ),
                                                    ),
                                                  );
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.done) {
                                                  if (snapshot.hasError) {
                                                    return Text(
                                                        'Error: ${snapshot.error}');
                                                  } else if (snapshot.hasData) {
                                                    return ListView(
                                                      children:
                                                          possibleMinorListTiles(),
                                                    );
                                                  } else {
                                                    return const Text(
                                                        'Empty data');
                                                  }
                                                } else {
                                                  return Text(
                                                      'State: ${snapshot.connectionState}');
                                                }
                                              }),
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
              heightFactor: .3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.fromLTRB(28.0, 16.0, 28.0, 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.height / 9,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight * .06,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Current GPA",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 4,
                        child: const Divider(
                          color: Colors.grey,
                        ),
                      ),
                      FutureBuilder(
                          future:
                              gpaClass().getGPA().then((value) => gpa = value),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                width: screenWidth / 20,
                                height: screenWidth / 20,
                                alignment: Alignment.center,
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: CircularProgressIndicator(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                return SizedBox(
                                  width: screenWidth * .25,
                                  height: screenHeight * .15,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text("GPA: $gpa"),
                                  ),
                                );
                              } else {
                                return const Text('Empty data');
                              }
                            } else {
                              return Text('State: ${snapshot.connectionState}');
                            }
                          }),
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
          onPressed: () => addToCurrMajors(major),
          icon: const Icon(Icons.add),
          color: Theme.of(context).colorScheme.secondary,
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
          color: Theme.of(context).colorScheme.secondary,
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
      //currMajors.add(major);
      postStudentMajor(StudentMajor(major: major));
    });
  }

  void addToCurrMinors(String minor) {
    setState(() {
      //currMinors.add(minor);
      postStudentMinor(StudentMinor(minor: minor));
    });
  }
}
