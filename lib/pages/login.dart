import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase_options.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  initApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // if (prefs.getString('token') == null) {
    //
    // }

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  final forming = GlobalKey<FormState>();

  final inputEmail = TextEditingController();
  final inputPass = TextEditingController();

  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: [
            Image.asset("assets/smoke.png", fit: BoxFit.cover, height: 1080, width: 1080),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.only(top: 50)),
                    Image.asset("assets/Lantis App fit picture.png", height: 121,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8C8989)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.only(top: 28),
                      child: Column(
                        children: [
                          Form(
                            key: forming,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12, top: 30, left: 12, right: 12),
                                  child: TextFormField(
                                    controller: inputEmail,
                                    validator: (value) {
                                      if (value == null ||  value.isEmpty) {
                                        return 'Harap Masukkan Email';
                                      } else if (!value.contains("@")) {
                                        return "Harap masukkan email yang valid";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(14))
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                                  child: TextFormField(
                                    controller: inputPass,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap Masukkan Password';
                                      }
                                      return null;
                                    },
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(14)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 12, bottom: 22),
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    child: Text("Forgot Password?", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
                                    onTap: () {
                                      Navigator.pushNamed(context, "/forgetPass");
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12, left: 12),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (forming.currentState!.validate()) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Fitur berhasil!"), showCloseIcon: true, duration: Durations.extralong4)
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11)
                                      ),
                                      backgroundColor: Color.fromARGB(255, 2, 48, 73),
                                    ),
                                    child: const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color(0xFFFBBE4A)
                                      )
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 22, bottom: 22),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account? "),
                                      InkWell(
                                        splashColor: Color.fromARGB(0, 0, 0, 0),
                                        highlightColor: Color.fromARGB(0, 0, 0, 0),
                                        child: Text("Register Here", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                                        onTap: () {
                                          Navigator.pushReplacementNamed(context, "/register");
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
