import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import '../functions/loginAuth.dart';
import '../firebase_options.dart';
import '../overlay.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool hidePass = true;
  bool rememberMe = false;

  initApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        if (prefs.getBool("remember_me") == true) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => overlay()), (route) => false);
        }
      } else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => overlay()), (route) => false);
        print('User is signed in!');
      }
    });
  }

  final forming = GlobalKey<FormState>();

  final inputEmail = TextEditingController();
  final inputPass = TextEditingController();

  @override
  void dispose() {
    inputEmail.dispose();
    inputPass.dispose();
    super.dispose();
  }

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
                                  padding: const EdgeInsets.only(left: 12, right: 12),
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
                                    obscureText: hidePass,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(14)),
                                      ),
                                      suffixIcon: IconButton(
                                        color: const Color.fromRGBO(0, 0, 0, 120),
                                        icon: Icon(hidePass
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            hidePass = !hidePass;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 14, bottom: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: rememberMe,
                                            activeColor: Color.fromARGB(255, 112, 118, 123),
                                            onChanged: (bool? value){
                                              setState(() {
                                                rememberMe = value!;
                                              });
                                            }
                                          ),
                                          Text("Remember Me", style: TextStyle(color: Color.fromARGB(255, 112, 118, 123))),
                                        ],
                                      ),
                                      InkWell(
                                        child: Text("Forgot Password?", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 88, 84, 84))),
                                        onTap: () {
                                          Navigator.pushNamed(context, "/forgetPass");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12, left: 12),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (forming.currentState!.validate()) {
                                        final SharedPreferences prefs = await SharedPreferences.getInstance();

                                        if (rememberMe == false) {
                                          FireAuthLogin().loginWithPassword(inputEmail.text, inputPass.text, context);
                                          prefs.setBool("remember_me", false);
                                        } else if (rememberMe == true) {
                                          FireAuthLogin().loginWithPassword(inputEmail.text, inputPass.text, context);
                                          prefs.setBool("remember_me", true);
                                        }

                                      };
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
                                      Text("Don't have an account? ", style: TextStyle(color: Color.fromARGB(255, 88, 84, 84), fontWeight: FontWeight.w500)),
                                      InkWell(
                                        splashColor: Color.fromARGB(0, 0, 0, 0),
                                        highlightColor: Color.fromARGB(0, 0, 0, 0),
                                        child: Text("Register Here", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Color.fromARGB(255, 66, 65, 65))),
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
