import 'package:flutter/material.dart';

import 'subWidgets.dart';

class searchWidget {
  Stack topBar(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 28),
          alignment: Alignment.topCenter,
          child: Text("Search", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Container lastSeen() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Last Seen", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          Container(
            margin: EdgeInsets.only(top: 24),
            height: 88,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/poster/gambar_1.png", height: 88, width: 94, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/card/card_0.png", height: 88, width: 94, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/card/card_1.png", height: 88, width: 94, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/poster/gambar_3.png", height: 88, width: 94, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container history(InkWell seemore) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Last Search", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Text("Clear All", style: TextStyle(fontSize: 14, color: Colors.red)),
            ],
          ),
          SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.schedule_rounded, color: Color.fromARGB(255, 112, 118, 123)),
              SizedBox(width: 14),
              Text("data", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 112, 118, 123))),
              Expanded(child: Container()),
              Icon(Icons.close_rounded, color: Color.fromARGB(255, 112, 118, 123)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.schedule_rounded, color: Color.fromARGB(255, 112, 118, 123)),
              SizedBox(width: 14),
              Text("data", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 112, 118, 123))),
              Expanded(child: Container()),
              Icon(Icons.close_rounded, color: Color.fromARGB(255, 112, 118, 123)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.schedule_rounded, color: Color.fromARGB(255, 112, 118, 123)),
              SizedBox(width: 14),
              Text("data", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 112, 118, 123))),
              Expanded(child: Container()),
              Icon(Icons.close_rounded, color: Color.fromARGB(255, 112, 118, 123)),
            ],
          ),
          SizedBox(height: 24),
          seemore,

          // InkWell(
          //   onTap: () {
          //     searchPage().setIndex(1);
          //   },
          //   child: Container(
          //     height: 60,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 230, 243, 255),
          //       border: Border.all(color: Color.fromARGB(255, 44, 149, 241)),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Text("See More", style: TextStyle(color: Color.fromARGB(255, 44, 149, 241), fontWeight: FontWeight.w600, fontSize: 18)),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container popular() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Search", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          SizedBox(height: 24),
          subWidgetss().popularSearchCard("assets/poster/gambar_1.png", "Synchronize Fest 2024", "350.000"),
          SizedBox(height: 24),
          subWidgetss().popularSearchCard("assets/poster/gambar_3.png", "Pestapora 2024", "450.000"),
          SizedBox(height: 28),
        ],
      ),
    );
  }
}