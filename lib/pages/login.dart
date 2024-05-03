import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final forming = GlobalKey<FormState>();

  final inputEmail = TextEditingController();
  final inputPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Container(
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
                                  // this
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
                                      SnackBar(content: Text("Fitur berhasil!"), showCloseIcon: true, duration: Durations.extralong4,)
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11)
                                  ),
                                  backgroundColor: Color.fromARGB(255, 2, 48, 73),
                                ),
                                child: Text(
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
                                    child: Text("Register Here", style: TextStyle(fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
