import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../overlay.dart';

class FireAuthLogin {
  loginWithPassword(String emailAddress, String password, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential? user;

    try {
      user = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (user.user != null) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const overlay()), (route) => false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Oops... I think something error!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Please check you email and password again!", style: TextStyle(color: Colors.white)),
              Text("If you don't have account, you can make one!", style: TextStyle(color: Colors.white)),
            ],
          ),
          showCloseIcon: true,
          duration: Duration(seconds: 20),
        ),
      );
    }
  }
}