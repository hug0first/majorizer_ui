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
  String? userFirstName;
  String? userLastName;
  String? userEmail;

  _userInitData({this.userFirstName, this.userLastName, this.userEmail});

  Map<String, dynamic> toJson() => {
        'firstname': userFirstName,
        'lastname': userLastName,
        'email': userEmail
      };
}

_userInitData _data = new _userInitData();

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Sign in with Google'),
          onPressed: () => _signInWithGoogle(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
  /*
  void _showSignUpScreen() {
      Navigator.of(context).pushNamed('/home');
    } */

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

        final names = displayName.split(' ');
        final gfirstName = names[0];
        final glastName = names[1];

        _data.userEmail = email;
        _data.userFirstName = gfirstName;
        _data.userLastName = glastName;

        firstName = gfirstName;
        lastName = glastName;
        emailAdrs = email;

        Navigator.of(context).pushNamed('/home');
        /*
        var url = Uri.https('example.com', 'whatsit/create');
        var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        print(await http.read(Uri.https('example.com', 'foobar.txt')));
        */

        var result = await http.post(Uri.parse('url'),
            body: json.encode(_data.toJson()),
            headers: {'content-type': 'application/json'});
        if (result.statusCode == 201) {
          print('success');
          //Navigator.of(context).pushNamed('/home');
        }

        // InitPost init = await
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Welcome, ${user!.displayName}"),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign in with Google: $error"),
        ),
      );
    }
  }
}
