import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login.dart';

bool notifToggle = true;

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18, right: 18),
              child: ListView(
                children: [
                  SizedBox(height: 60),
                  SizedBox(height: 18),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 48, 73),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.asset("assets/picture.jpg", width: 68),
                          borderRadius: BorderRadius.circular(911),
                        ),
                        SizedBox(width: 26),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Kyooshees", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(height: 6),
                            Text("+62 81359367369", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.settings, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/Visa.png", height: 56),
                        SizedBox(width: 20),
                        Text("**** **** **** 8967", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                        Expanded(child: Container()),
                        Icon(Icons.keyboard_arrow_right_rounded, size: 42),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Image.asset("assets/profile_icon/myconcert.png", width: 28, fit: BoxFit.fill),
                            SizedBox(width: 12),
                            Text("My Concert", style: TextStyle(color: Color.fromARGB(255, 111, 110, 110), fontWeight: FontWeight.w500, fontSize: 16)),
                            Expanded(child: Container()),
                            Icon(Icons.keyboard_arrow_right_rounded, size: 32, color: Color.fromARGB(255, 132, 131, 131)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Image.asset("assets/profile_icon/liked.png", width: 28, fit: BoxFit.fill),
                            SizedBox(width: 12),
                            Text("Liked Content", style: TextStyle(color: Color.fromARGB(255, 111, 110, 110), fontWeight: FontWeight.w500, fontSize: 16)),
                            Expanded(child: Container()),
                            Icon(Icons.keyboard_arrow_right_rounded, size: 32, color: Color.fromARGB(255, 132, 131, 131)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Image.asset("assets/profile_icon/voucher.png", width: 28, fit: BoxFit.fill),
                            SizedBox(width: 12),
                            Text("My Voucher", style: TextStyle(color: Color.fromARGB(255, 111, 110, 110), fontWeight: FontWeight.w500, fontSize: 16)),
                            Expanded(child: Container()),
                            Icon(Icons.keyboard_arrow_right_rounded, size: 32, color: Color.fromARGB(255, 132, 131, 131)),
                          ],
                        ),
                        SizedBox(height: 30),

                        Text("Notification", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Image.asset("assets/profile_icon/notif.png", width: 28, fit: BoxFit.fill),
                            SizedBox(width: 12),
                            Text("Notification", style: TextStyle(color: Color.fromARGB(255, 111, 110, 110), fontWeight: FontWeight.w500, fontSize: 16)),
                            Expanded(child: Container()),
                            Container(
                              height: 12,
                              child: Switch.adaptive(
                                value: notifToggle,
                                onChanged: (value) => setState(() => notifToggle = value),
                                activeColor: Color.fromARGB(255, 255, 255, 255),
                                activeTrackColor: Color.fromARGB(255, 2, 48, 73),
                                inactiveTrackColor: Color.fromARGB(255, 111, 110, 110),
                                inactiveThumbColor: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        Text("Other", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Image.asset("assets/profile_icon/cache.png", width: 28, fit: BoxFit.fill),
                            SizedBox(width: 12),
                            Text("Cache", style: TextStyle(color: Color.fromARGB(255, 111, 110, 110), fontWeight: FontWeight.w500, fontSize: 16)),
                            Expanded(child: Container()),
                            Icon(Icons.keyboard_arrow_right_rounded, size: 32, color: Color.fromARGB(255, 132, 131, 131)),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Image.asset("assets/profile_icon/privacy.png", width: 28, fit: BoxFit.fill),
                            SizedBox(width: 12),
                            Text("Privacy Policy", style: TextStyle(color: Color.fromARGB(255, 111, 110, 110), fontWeight: FontWeight.w500, fontSize: 16)),
                            Expanded(child: Container()),
                            Icon(Icons.keyboard_arrow_right_rounded, size: 32, color: Color.fromARGB(255, 132, 131, 131)),
                          ],
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () async {
                            final SharedPreferences prefs = await SharedPreferences.getInstance();

                            await FirebaseAuth.instance.signOut();
                            prefs.setBool("remember_me", false);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login()), (route) => false);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.logout, size: 28, color: Colors.red),
                              SizedBox(width: 12),
                              Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 16)),
                              Expanded(child: Container()),
                              Icon(Icons.keyboard_arrow_right_rounded, size: 32, color: Colors.red),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: List.filled(1, BoxShadow(color: Colors.black38, blurRadius: 8)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded, size: 28),
                  ),
                  SizedBox(width: 4),
                  Text("My Profile", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
