import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class forgorPass extends StatefulWidget {
  const forgorPass({super.key});

  @override
  State<forgorPass> createState() => _forgorPassState();
}

class _forgorPassState extends State<forgorPass> {
  final forming = GlobalKey<FormState>();

  final inputEmail = TextEditingController();

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
                    Container(margin: const EdgeInsets.only(top: 50)),
                    Image.asset("assets/Lantis App fit picture.png", height: 121,),
                    const Padding(
                      padding: EdgeInsets.all(18),
                      child: Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF8C8989)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Form(
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
                            Container(
                              margin: const EdgeInsets.only(right: 12, left: 12, bottom: 16, top: 16),
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (forming.currentState!.validate()) {
                                    FirebaseAuth auth = FirebaseAuth.instance;

                                    try {
                                      await auth.sendPasswordResetEmail(email: inputEmail.text);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Email sended!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                              Text("You can check your email!", style: TextStyle(color: Colors.white)),
                                            ],
                                          ),
                                          showCloseIcon: true,
                                          duration: Duration(seconds: 20),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Oops! Something went wrong!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                              Text("Please try again!", style: TextStyle(color: Colors.white)),
                                            ],
                                          ),
                                          showCloseIcon: true,
                                          duration: Duration(seconds: 20),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11)
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 2, 48, 73),
                                ),
                                child: const Text(
                                  "SEND",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xFFFBBE4A)
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
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

