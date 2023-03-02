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

class AdvisorBuildScreen extends StatelessWidget {
  const AdvisorBuildScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
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
      backgroundColor: const Color(0xFFe79772),
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
      backgroundColor: Color(0xFFe79772),
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
      backgroundColor: const Color(0xFFe79772),
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
      body: Center(
        child: Align(
          alignment: const Alignment(-.8, -.4),
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
