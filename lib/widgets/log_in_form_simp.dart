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

class _userCheckData {
  String? userEmail;

  _userCheckData({this.userEmail});

  Map<String, dynamic> toJson() => {
        "emailaddress" : userEmail
      };
}

_userCheckData _data = new _userCheckData();

class LoginPageSimp extends StatelessWidget {
  const LoginPageSimp();

  @override
  Widget build(BuildContext context) { 

    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: const Color(0xFFF3956F),
      ),
      
      body: Center(
        child:

          ElevatedButton(
          child: Text('Log in with Google',
          style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          onPressed: () => _signInWithGoogle(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
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

        _data.userEmail = email;

        firstName = gfirstName;
        lastName = glastName;
        emailAdrs = email;

        var response = await http.post(
          Uri.parse('http://127.0.0.1:8000/user_sign_up/'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(_data.toJson()),
        );

        Navigator.of(context).pushNamed('/home');
        
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to sign in with Google: $error"),
        ),
      );
    }
  }

