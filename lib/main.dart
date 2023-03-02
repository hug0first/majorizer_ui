import 'package:flutter/material.dart';

void main() => runApp(const Majorizer());
String firstName = "";

class Majorizer extends StatelessWidget {
  const Majorizer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Majorizer',
      routes: {
        '/signUp': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/landing': (context) => const LandingScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/studentBuild': (context) => const StudentBuildScreen(),
        '/history': (context) => const HistoryScreen(),
        '/advisorManager': (context) => AdvisorManagerScreen(),
        '/advisorBuild': (context) => const AdvisorBuildScreen(),
        '/studentManager': (context) => const StudentManagerScreen(),
        '/courseManager': (context) => const CourseManagerScreen(),
      },
      initialRoute: '/landing',
    );
  }
}

class CourseManagerScreen extends StatelessWidget {
  const CourseManagerScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class StudentManagerScreen extends StatelessWidget {
  const StudentManagerScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class AdvisorManagerScreen extends StatelessWidget {
  AdvisorManagerScreen();

  // These are temporary values until the backend/database connection is made
  final advisors = ['Sean Banerjee', 'Chuck Thorpe'];
  final depts = ['Computer Science', 'Computer Science'];
  final roles = ['Research', 'Academic'];
  final emails = ['sbanerje@clarkson.edu', 'cthorpe@clarkson.edu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(80, 0, 0, 0),
                    ),
                  ],
                ),
              );
            },
          ),
          leadingWidth: 150,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                height: 0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/advisorManager');
                  },
                  child: const Text(
                    'Advisor Manager',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFda6237),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                height: 0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/history');
                  },
                  child: const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFda6237),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(children: [
          Container(
              height: 75,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 25, left: 40),
              margin: EdgeInsets.zero,
              child: Text('Advisor Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Flexible(
              child: Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: Row(children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                  flex: 2,
                  child: Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Department',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Role',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ]),
          )),
          Container(width: 1250, child: Divider(color: Colors.grey)),
          Flexible(
            child: ListView.builder(
                itemCount: advisors.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Spacer(flex: 1),
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

class HistoryScreen extends StatefulWidget {
  const HistoryScreen();

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  // These are temporary values until the backend/database connection is made
  final courses = ['CS 141', 'CS 142', 'CS 241'];
  final titles = [
    'Introduction to Computer Science I',
    'Introduction to Computer Science II',
    'Computer Organization'
  ];
  final term = ['Fall 2021', 'Fall 2021', 'Spring 2022'];
  final grades = ['T', 'A', 'B'];
  final credits = ['4', '3', '3'];
  final status = ['Transferred', 'Taken', 'Taken'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(80, 0, 0, 0),
                    ),
                  ],
                ),
              );
            },
          ),
          leadingWidth: 150,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                height: 0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/advisorManager');
                  },
                  child: const Text(
                    'Advisor Manager',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFda6237),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                height: 0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/history');
                  },
                  child: const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFda6237),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(children: [
          Container(
              height: 75,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 25, left: 40),
              margin: EdgeInsets.zero,
              child: Text('Course List',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Container(
            width: 2500,
            height: 45,
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(left: 1050, right: 75),
            margin: EdgeInsets.zero,
            child: TextField(
                onChanged: searchCourses,
                decoration: InputDecoration(
                    hintText: 'Search...',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)))),
          ),
          Flexible(
              child: Container(
            height: 50,
            alignment: Alignment.bottomCenter,
            child: Row(children: <Widget>[
              Spacer(flex: 1),
              Expanded(
                  flex: 2,
                  child: Text('Course ID',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 5,
                  child: Text('Course Title',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Term',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Grade',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Credits',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  flex: 2,
                  child: Text('Status',
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ]),
          )),
          Container(width: 1400, child: Divider(color: Colors.grey)),
          Flexible(
            child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    child: Row(children: <Widget>[
                      Spacer(flex: 1),
                      Expanded(flex: 2, child: Text(courses[index])),
                      Expanded(
                          flex: 5,
                          child: Text(titles[index],
                              overflow: TextOverflow.ellipsis)),
                      Expanded(flex: 2, child: Text(term[index])),
                      Expanded(child: Text(grades[index])),
                      Expanded(child: Text(credits[index])),
                      Expanded(flex: 2, child: Text(status[index]))
                    ]),
                  );
                }),
          ),
        ]));
  }

  // these are the event handler for searching and filtering courses...will figure this out later
  searchCourses(String text) async {}
}

class StudentBuildScreen extends StatelessWidget {
  const StudentBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen();

  void navToSignUp(BuildContext context) {
    Navigator.of(context).pushNamed('/signUp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3956F),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 35,
              onPressed: () {
                Navigator.of(context).pushNamed('/landing');
              },
              icon: const Icon(
                Icons.home,
                color: Color(0xFFda6237),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(80, 0, 0, 0),
                  ),
                ],
              ),
            );
          },
        ),
        leadingWidth: 150,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: SizedBox(
              height: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      '/signUp'); //eventually should be changed to a separate Login page
                  //user is just making a new account every time they visit, essentially
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFda6237),
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Majorizer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 126,
                    fontFamily: 'Montserrat',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 350),
                child: const Text(
                  'Where you plan courses until graduation',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              //NOTE:
              //Drop shadow for sign up button still needs to be implemented properly
              //the boxShadow below is what I currently have, but I can't get it to not drop to the bottom of the window
              /*boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  //offset: const Offset(0, )\,
                ),
              ],*/
            ),
            padding: const EdgeInsets.fromLTRB(0, 0, 80, 250),
            child: SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  navToSignUp(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 20,
                  shadowColor: const Color.fromARGB(
                      120, 0, 0, 0), //still need to add shadow to this widget
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xFFda6237),
                    fontSize: 44,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      /*const Center(
        child: Align(
          alignment: Alignment(-.8, -.4),
          child: Text(
            'Majorizer',
            style: TextStyle(
              //still need to add Montserrat into the pubspec.yaml file or whatever else it needs to show up
              //it will not break without it, it just will be in a defualt font
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 96,
              fontFamily: 'Montserrat',
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(120, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF3956F),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3956F),
      //drawer: SideMenu()
      appBar: AppBar(
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
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(80, 0, 0, 0),
                  ),
                ],
              ),
            );
          },
        ),
        leadingWidth: 150,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: SizedBox(
              height: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/advisorManager');
                },
                child: const Text(
                  'Advisor Manager',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFda6237),
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: SizedBox(
              height: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/history');
                },
                child: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFda6237),
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Welcome, $firstName!',
                  style: const TextStyle(
                    //still need to add Montserrat into the pubspec.yaml file or whatever else it needs to show up
                    //it will not break without it, it just will be in a defualt font
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 96,
                    fontFamily: 'Montserrat',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(4.0, 4.0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: 675,
                  height: 450,
                  child:
                      Image.asset('assets/images/man_holding_laptop_art.png')),
            ],
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / (controllers.length + 1);
      }
    }

    firstName = _firstNameTextController.text;
    var password = _passwordTextController.text;
    if ((password.length >= 5) &&
        (_passwordTextController.value.text.isNotEmpty)) {
      progress += 1 / (controllers.length + 1);
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showHomeScreen() {
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign up', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: const InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: const InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.disabled)
                    ? null
                    : const Color(0xFFda6237);
              }),
            ),
            onPressed: _formProgress == 1 ? _showHomeScreen : null,
            child: const Text('Sign up'),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  const AnimatedProgressIndicator({
    required this.value,
  });

  @override
  State<AnimatedProgressIndicator> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);

    final colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }
}
