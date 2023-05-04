import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:majorizer_ui/main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
//final GoogleSignIn googleSignIn = GoogleSignIn();

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
  clientId:
      '956282452798-a1o5tgrgkenmq4a5onr6jnimju6km1cs.apps.googleusercontent.com',
);

class _userInitData {
  String? userName;
  String? userFirstName;
  String? userLastName;
  String? userEmail;
  String? userSorA;
  String? advDepa;
  String? advPosi;

  _userInitData({this.userName, this.userFirstName, this.userLastName, this.userEmail, this.userSorA});

  Map<String, dynamic> toJson() => {
        "uname" : userName,
        "fname" : userFirstName,
        "lname" : userLastName,
        "emailaddress" : userEmail,
        "SorA" : userSorA,
        "department" : advDepa,
        "position" : advPosi
      };
}

_userInitData _data = new _userInitData();
bool _showTextFields = false;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _departmentController = TextEditingController();
  final _positionController = TextEditingController();

  @override
  void dispose() {
    _departmentController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the contents horizontally
              children: [
                Switch(
                  value: _showTextFields,
                  onChanged: (value) {
                    setState(() {
                      _showTextFields = value;
                    });
                  },
                ),
                Text('Advisor'), // Display a sentence next to the switch
              ],
            ),
            SizedBox(height: 10), // This adds some space between the button and the text fields
            if (_showTextFields)
              Column(
                children: [
                  SizedBox(
                    width: 200, // Set the width of the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Department',
                      ),
                      controller: _departmentController,
                    ),
                  ),
                  SizedBox(
                    width: 200, // Set the width of the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Position',
                      ),
                      controller: _positionController,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ElevatedButton(
              child: Text('Sign up with Google',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              onPressed: () { 
                if (_showTextFields){
                  _data.advDepa = _departmentController.text;
                  _data.advPosi = _positionController.text;
                }
                _signInWithGoogle(context);},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  void _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      final String? displayName = user?.displayName;
      final String? email = user?.email;

      if (email != null && displayName != null) {
        if (!email.endsWith("clarkson.edu"))
          throw FormatException('Please Log in with Clarkson Account');

        final username = email.split('@')[0];
        final names = displayName.split(' ');
        final gfirstName = names[0];
        final glastName = names[1];

        _data.userName = username;
        _data.userEmail = email;
        _data.userFirstName = gfirstName;
        _data.userLastName = glastName;
        
        if(_showTextFields){ 
          _data.userSorA = "A";
        }
        else _data.userSorA = "S";

        var response = await http.post(
          Uri.parse('http://127.0.0.1:8000/user_sign_up/'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(_data.toJson()),
        );

        if(response.body == "User Added") Navigator.of(context).pushNamed('/home');
        else if(response.body == "Existing User") Navigator.of(context).pushNamed('/logInSimp');
        else Navigator.of(context).pushNamed('/logIn');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign in with Google: $error"),
        ),
      );
    }
  }

