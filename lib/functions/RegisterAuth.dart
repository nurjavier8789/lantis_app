import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuthRegis {
  registerMas(BuildContext context, String email, String pass, String username) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential? userCredential;
    User? user;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      user = userCredential.user;
      await user!.updateDisplayName(username);
      await user.reload();
      user = auth.currentUser;
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (a) {
      if (a.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your password looks weak.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("You may try make password at least 6 characters and combine it with symbols or numbers!", style: TextStyle(color: Colors.white)),
              ],
            ),
            showCloseIcon: true,
            duration: Duration(seconds: 20),
            backgroundColor: Colors.red,
          ),
        );
      } else if (a.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email already in use!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Try different email and try again!", style: TextStyle(color: Colors.white)),
              ],
            ),
            showCloseIcon: true,
            duration: Duration(seconds: 20),
            backgroundColor: Colors.red,
          ),
        );
      } else if (a.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Umm... I think you should check you email again...", style: TextStyle(color: Colors.white)),
            showCloseIcon: true,
            duration: Duration(seconds: 20),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Oops... I think something error! Please check everything once again then try again!"), showCloseIcon: true, duration: Duration(seconds: 20)),
      );
      print(e);
    }

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Email created! Now you can try to login!", style: TextStyle(color: Colors.white)),
            showCloseIcon: true,
            duration: Duration(seconds: 20),
            backgroundColor: Colors.green,
          ),
      );
      Navigator.pushReplacementNamed(context, "/");
    }
  }
}