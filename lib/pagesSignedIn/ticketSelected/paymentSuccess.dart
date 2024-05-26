import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/ticketDetailWidgets.dart';

class paymentSuccess extends StatefulWidget {
  const paymentSuccess({super.key});

  @override
  State<paymentSuccess> createState() => _paymentSuccessState();
}

class _paymentSuccessState extends State<paymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset("assets/doodle.png", fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width,),
            ),

            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 100),
                    Text("Payment Success!", style: TextStyle(color: Color.fromARGB(255, 31, 39, 46), fontWeight: FontWeight.w600, fontSize: 32)),
                    SizedBox(height: 8),
                    Text("Show this evidence to the childcare", style: TextStyle(color: Color.fromARGB(255, 112, 118, 123), fontWeight: FontWeight.normal, fontSize: 18)),
                    SizedBox(height: 24),
                    Center(
                      child: Image.asset("assets/tiketqr.png"),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        backgroundColor: Color.fromARGB(255, 2, 48, 73),
                        fixedSize: Size(128, 42),
                      ),
                      child: Text("CONTINUE", style: TextStyle(color: Color.fromARGB(255, 251, 190, 74), fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: 4, top: 4, bottom: 4),
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
                    icon: Icon(Icons.close_rounded, size: 28),
                  ),
                  Text("Lantis", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
