import 'package:flutter/material.dart';

import '../functions/RegisterAuth.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final forming = GlobalKey<FormState>();

  final inputEmail = TextEditingController();
  final inputUser = TextEditingController();
  final inputPass = TextEditingController();
  final inputConfirmPass = TextEditingController();

  bool hidePass1 = true;
  bool hidePass2 = true;

  @override
  void dispose() {
    inputEmail.dispose();
    inputUser.dispose();
    inputPass.dispose();
    inputConfirmPass.dispose();
    super.dispose();
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
                    Container(margin: EdgeInsets.only(top: 50),),
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
                                      if (value == null || value.isEmpty) {
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
                                    controller: inputUser,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap Masukkan Username';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Username",
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
                                    obscureText: hidePass1,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(14)),
                                      ),
                                      suffixIcon: IconButton(
                                        color: const Color.fromRGBO(0, 0, 0, 120),
                                        icon: Icon(hidePass1
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            hidePass1 = !hidePass1;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 32, left: 12, right: 12),
                                  child: TextFormField(
                                    controller: inputConfirmPass,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Harap Konfirmasi Password';
                                      } else if (inputPass.text != inputConfirmPass.text) {
                                        return 'Password tidak sama!';
                                      }
                                      return null;
                                    },
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText: hidePass2,
                                    decoration: InputDecoration(
                                      labelText: "Confirm Password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(14)),
                                      ),
                                      suffixIcon: IconButton(
                                        color: const Color.fromRGBO(0, 0, 0, 120),
                                        icon: Icon(hidePass2
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            hidePass2 = !hidePass2;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12, left: 12),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (forming.currentState!.validate()) {
                                        FireAuthRegis().registerMas(context, inputEmail.text, inputPass.text, inputUser.text);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(11)
                                      ),
                                      backgroundColor: Color.fromARGB(255, 2, 48, 73),
                                    ),
                                    child: const Text(
                                        "REGISTER",
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
                                      Text("Already have an account? "),
                                      InkWell(
                                        splashColor: Color.fromARGB(0, 0, 0, 0),
                                        highlightColor: Color.fromARGB(0, 0, 0, 0),
                                        child: Text("Login Here", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                                        onTap: () {
                                          Navigator.pushReplacementNamed(context, "/");
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
