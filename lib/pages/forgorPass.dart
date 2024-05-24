import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    Container(margin: EdgeInsets.only(top: 50)),
                    Image.asset("assets/Lantis App fit picture.png", height: 121,),
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF8C8989)),
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
                              margin: EdgeInsets.only(right: 12, left: 12, bottom: 16, top: 16),
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (forming.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Enail Telah Dikirim!"), showCloseIcon: true, duration: Duration(seconds: 20))
                                    );
                                    Navigator.pushReplacementNamed(context, '/');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11)
                                  ),
                                  backgroundColor: Color.fromARGB(255, 2, 48, 73),
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

