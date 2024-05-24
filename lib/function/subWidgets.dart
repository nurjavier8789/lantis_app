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
}