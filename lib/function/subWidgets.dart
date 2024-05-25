import 'package:flutter/material.dart';

class subWidgetss {
  Container eventCard(String filePath, String eventName, String location, String price ,double deviceWidth) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 20),
      child: Card(
        child: Column(
          children: [
            Image.asset(filePath, width: deviceWidth, fit: BoxFit.fill,),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(location, style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 123, 123, 123))),
                      Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container videoList(String filePath, String title, int views, String date, int like) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 264,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(filePath, width: 264, fit: BoxFit.fill),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$views Ditonton | $date", style: TextStyle(color: Color.fromARGB(255, 123, 123, 123))),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$like", style: TextStyle(color: Color.fromARGB(255, 123, 123, 123))),
                    SizedBox(width: 4),
                    Icon(Icons.thumb_up_outlined, color: Color.fromARGB(255, 123, 123, 123), size: 15,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}