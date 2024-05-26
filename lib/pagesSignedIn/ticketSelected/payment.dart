import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/ticketDetailWidgets.dart';

class paymentMethod extends StatefulWidget {
  const paymentMethod({super.key});

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: 76),
                  Center(
                    child: Text("Checkout", style: TextStyle(color: Color.fromARGB(255, 31, 39, 46), fontWeight: FontWeight.w600, fontSize: 32)),
                  ),
                  SizedBox(height: 36),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            SizedBox(width: 24),
                            Text("Payment", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 8),
                        Image.asset("assets/cc.png"),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 44, 149, 241)),
                                color: Color.fromARGB(255, 235, 246, 255),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset("assets/mc.png", width: 72),
                            ),
                            SizedBox(width: 12),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 112, 118, 123)),
                                color: Color.fromARGB(0, 255, 255, 255),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset("assets/pp.png", height: 28),
                            ),
                            SizedBox(width: 12),
                            Container(
                              padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 112, 118, 123)),
                                color: Color.fromARGB(0, 255, 255, 255),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset("assets/Visa.png", width: 72),
                            ),
                            SizedBox(width: 12),
                            Container(
                              padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 112, 118, 123)),
                                color: Color.fromARGB(0, 255, 255, 255),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Image.asset("assets/gpay.png", width: 72),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        Wrap(
                          children: [
                            SizedBox(width: 24),
                            Text("Cash On Delivery", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 12),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 235, 246, 255),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset("assets/cod.png", height: 28),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Cash On Delivery", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                                  Text("Pay in cash", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color.fromARGB(255, 112, 118, 123))),
                                ],
                              ),
                              Expanded(child: Container()),
                              Radio(
                                value: "",
                                groupValue: "",
                                onChanged: (value) {},
                                activeColor: Color.fromARGB(255, 44, 149, 241),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ticketDetailWidgets().topBar(context),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.only(top: 24, bottom: 24, left: 32, right: 32),
                  color: Colors.white,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 222, 255, 225),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset("assets/vocer.png", height: 28,),
                          ),
                          Expanded(child: Container()),
                          Text("Add voucher code", style: TextStyle(color: Color.fromARGB(255, 112, 118, 123))),
                          Icon(Icons.keyboard_arrow_right_rounded, color: Color.fromARGB(255, 112, 118, 123)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Price", style: TextStyle(color: Color.fromARGB(255, 112, 118, 123))),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Rp ", style: TextStyle(color: Color.fromARGB(255, 254, 196, 32), fontWeight: FontWeight.bold)),
                                  Text("850.000", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
                                ],
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/paymentSuccess");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              backgroundColor: Color.fromARGB(255, 2, 48, 73),
                              fixedSize: Size(148, 52),
                            ),
                            child: Text("PAY NOW", style: TextStyle(color: Color.fromARGB(255, 251, 190, 74), fontWeight: FontWeight.w600, fontSize: 18)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

