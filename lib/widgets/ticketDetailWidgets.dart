import 'package:flutter/material.dart';
import 'package:lantis/pagesSignedIn/ticketSelected/payment.dart';
import 'package:lantis/pagesSignedIn/ticketSelected/ticketDetail.dart';

import 'package:url_launcher/url_launcher.dart';

class ticketDetailWidgets {
  AlertDialog exitWarn(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.only(left: 22, right: 22, bottom: 14),
      titlePadding: EdgeInsets.only(left: 22, right: 22, top: 18, bottom: 14),
      actionsPadding: EdgeInsets.only(bottom: 16, right: 22),
      title: const Text("Do you really want to leave this page?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19)),
      content: const Text("You will return to the LANTIS main page, continue?", style: TextStyle(fontSize: 15)),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text("No", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        ),
        SizedBox(width: 4),
        InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text("Yes", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        ),
      ],
    );
  }

  Container topBar(BuildContext context) {
    return Container(
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return exitWarn(context);
                },
              );
            },
            icon: Icon(Icons.close_rounded, size: 28),
          ),
          Text("Lantis", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
        ],
      ),
    );
  }

  Container ticketDetails() {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Image.asset("assets/detail_tiket.png"),
          ),
          SizedBox(height: 16),
          Text("SYNCHRONIZE FEST 2024", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          SizedBox(height: 12),
          Divider(color: Color.fromARGB(153, 0, 0, 0)),
          SizedBox(height: 28),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.calendar_month_outlined, color: Color.fromARGB(179, 41, 45, 50)),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("4-6 Oktober 2024", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          SizedBox(height: 32),
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.location_on_outlined, color: Color.fromARGB(179, 41, 45, 50)),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("""
Gambir Expo Kemayoran,
Jakarta Pusat""",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.white,
              side: BorderSide(color: Color.fromARGB(179, 41, 45, 50)),
            ),
            onPressed: () async {
              await launchUrl(Uri.parse('https://maps.app.goo.gl/jCw3WcNv5sv1qPcb6'), mode: LaunchMode.externalApplication);
            },
            child: Text("LIHAT PETA", style: TextStyle(color: Color.fromARGB(179, 41, 45, 50))),
          ),
          SizedBox(height: 24),
          Divider(color: Color.fromARGB(153, 0, 0, 0)),
          Divider(thickness: 5, color: Color.fromARGB(255, 104, 104, 104)),
        ],
      ),
    );
  }

  Container selectTicketpt1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 32, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Your Ticket", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          SizedBox(height: 16),
          Divider(thickness: 5, color: Color.fromARGB(255, 104, 104, 104), height: 0),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 225, 223, 223),
              border: Border.all(color: Color.fromARGB(51, 0, 0, 0))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daily Pass Regular", style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("IDR 350.000", style: TextStyle(color: Color.fromARGB(255, 2, 48, 73))),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color.fromARGB(255, 119, 110, 110)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove_rounded, size: 16, color: Color.fromARGB(255, 119, 110, 110)),
                      SizedBox(width: 16),
                      Text("0", style: TextStyle(color: Color.fromARGB(255, 119, 110, 110))),
                      SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sold out! Sorry... (>_<)"),
                              showCloseIcon: true,
                            ),
                          );
                        },
                        child: Icon(Icons.add_rounded, size: 16, color: Color.fromARGB(255, 119, 110, 110)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 225, 223, 223),
              border: Border.all(color: Color.fromARGB(51, 0, 0, 0))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daily Pass On The Spot", style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("IDR 450.000", style: TextStyle(color: Color.fromARGB(255, 2, 48, 73))),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color.fromARGB(255, 119, 110, 110)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove_rounded, size: 16, color: Color.fromARGB(255, 119, 110, 110)),
                      SizedBox(width: 16),
                      Text("0", style: TextStyle(color: Color.fromARGB(255, 119, 110, 110))),
                      SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sold out! Sorry... (>_<)"),
                              showCloseIcon: true,
                            ),
                          );
                        },
                        child: Icon(Icons.add_rounded, size: 16, color: Color.fromARGB(255, 119, 110, 110)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container selectTicketpt2(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (jumlah3DayPass == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please choose the ticket!"),
                    showCloseIcon: true,
                  ),
                );
              } else {
                Navigator.pushReplacementNamed(context, '/paymentMethod');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 2, 48, 73),
              fixedSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("CONTINUE", style: TextStyle(color: Color.fromARGB(255, 251, 190, 74), fontSize: 18)),
          ),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.only(left: 42, right: 42),
            child: Text(
              "Synchronize Fest is an annual multi-genre music festival on a national scale that invites tens of thousands of audiences to celebrate the diversity of live music on five stages for three days and three nights, enjoying 100s of curated performances from the country's favorite and best artists who come from the '70s, '80s, '90s to the 2000s. All popular music genres will be featured at Synchronize Fest.",
              style: TextStyle(color: Color.fromARGB(255, 111, 110, 110)),
            ),
          ),
        ],
      ),
    );
  }
}
