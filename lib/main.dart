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
        '/SignUp': (context) => const SignUpScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/landing': (context) => const LandingScreen(),
        //'/accountPage': (context) => const AccountScreen(),
      },
      initialRoute: '/landing',
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen();

  void navToSignUp(BuildContext context) {
    Navigator.of(context).pushNamed('/SignUp');
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
                      '/SignUp'); //eventually should be changed to a separate Login page
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
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                'Majorizer',
                style: TextStyle(
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
              Text('Where you plan courses until graduation'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              navToSignUp(context);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(),
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

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

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
                Navigator.of(context).pushNamed('/welcome');
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

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
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
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
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
