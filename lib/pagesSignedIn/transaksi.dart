import 'package:flutter/material.dart';

import '../overlay.dart';

class receipt extends StatefulWidget {
  const receipt({super.key});

  @override
  State<receipt> createState() => _receiptState();
}

class _receiptState extends State<receipt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        animationDuration: Duration(milliseconds: 150),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 28, bottom: 28),
                alignment: Alignment.topCenter,
                child: Text("Receipt", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
              ),
              Divider(height: 0),
              TabBar(
                indicatorColor: Color.fromARGB(255, 92, 173, 244),
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                unselectedLabelStyle: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1,
                tabs: [
                  Tab(text: "Active Ticket"),
                  Tab(text: "Transaction List"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    emptyReceipt(context),
                    emptyReceipt(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

emptyReceipt(BuildContext context) {
  return ListView(
    children: [
      Column(
        children: [
          SizedBox(height: 240),
          Image.asset("assets/kosong.png"),
          SizedBox(height: 16),
          Text("Let's Go to a Concert!", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          SizedBox(height: 4),
          Text("Get Your Favorite Concert Tickets Now!", style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 158, 158, 158), fontSize: 14)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              overlay().setIndex(0);
              Navigator.pushReplacementNamed(context, "/overlay");
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(220, 36),
              backgroundColor: Color.fromARGB(255, 0, 48, 73),
              shape: RoundedRectangleBorder(),
            ),
            child: Text("View Concert", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 240),
        ],
      ),

    ],
  );
}
