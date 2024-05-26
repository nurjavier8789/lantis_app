import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/ticketDetailWidgets.dart';
import '../../widgets/homeWidgets.dart';

int jumlah3DayPass = 0;

class ticketDetails extends StatefulWidget {
  const ticketDetails({super.key});

  @override
  State<ticketDetails> createState() => _ticketDetailsState();
}

class _ticketDetailsState extends State<ticketDetails> {

  @override
  void dispose() {
    jumlah3DayPass = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ticketDetailWidgets().exitWarn(context);
              },
            );
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: 58),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(20),
                    child: Image.asset("assets/name_text.png", height: 28),
                  ),
                  ticketDetailWidgets().ticketDetails(),
                  ticketDetailWidgets().selectTicketpt1(context),
                  Container(
                    margin: EdgeInsets.only(left: 32, right: 32, bottom: 0, top: 0),
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
                            Text("3 Day Pass On The Spot", style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("IDR 850.000", style: TextStyle(color: Color.fromARGB(255, 2, 48, 73))),
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
                              InkWell(
                                onTap: () {
                                  if (jumlah3DayPass > 0) {
                                    setState(() {
                                      --jumlah3DayPass;
                                    });
                                  } else {
                                    return;
                                  }
                                },
                                child: Icon(Icons.remove_rounded, size: 16, color: Color.fromARGB(255, 119, 110, 110)),
                              ),
                              SizedBox(width: 16),
                              Text("$jumlah3DayPass", style: TextStyle(color: Color.fromARGB(255, 119, 110, 110))),
                              SizedBox(width: 16),
                              InkWell(
                                onTap: () {
                                  if (jumlah3DayPass < 1) {
                                    setState(() {
                                      ++jumlah3DayPass;
                                    });
                                  } else {
                                    return;
                                  }
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
                    margin: EdgeInsets.only(left: 32, right: 32),
                    child: Divider(thickness: 5, color: Color.fromARGB(255, 104, 104, 104), height: 0),
                  ),
                  SizedBox(height: 24),
                  ticketDetailWidgets().selectTicketpt2(context),
                  SizedBox(height: 200),
                  widgetss().footerHome(),
                ],
              ),

              ticketDetailWidgets().topBar(context),
            ],
          ),
        ),
      ),
    );
  }
}

