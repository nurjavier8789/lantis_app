import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/resultSearchWidgets.dart';
import '../overlay.dart';

final searchInputResult = TextEditingController();

class resultSearch extends StatefulWidget {
  const resultSearch({super.key});

  setTextInput(String a) {
    searchInputResult.text = a;
  }

  @override
  State<resultSearch> createState() => _resultSearchState();
}

class _resultSearchState extends State<resultSearch> {
  @override
  void dispose() {
    if (searchInputResult.text.isNotEmpty) {
      searchInputResult.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    overlay().setIndex(0);
                    Navigator.pushReplacementNamed(context, "/overlay");
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
                  child: Text("Result", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                ),
              ],
            ),

            Form(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 241, 241, 241),
                ),
                child: TextFormField(
                  controller: searchInputResult,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 161, 162, 163)),
                    suffixIcon: Icon(Icons.mic_none_rounded, color: Color.fromARGB(255, 161, 162, 162)),
                    hintText: "Search by a name or location...",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 112, 118, 123),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              height: MediaQuery.of(context).size.height - 280,
              child: ListView(
                children: [
                  Container(
                    height: 48,
                    margin: EdgeInsets.only(bottom: 24),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 44, 149, 241),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.tune_rounded, color: Colors.white),
                              SizedBox(width: 6),
                              Text("Filter", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        resultSearchWidgets().filterThing("Popular"),
                        resultSearchWidgets().filterThing("Near You"),
                        resultSearchWidgets().filterThing("Review"),
                        resultSearchWidgets().filterThing("Price"),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/detailTiket");
                    },
                    child: resultSearchWidgets().resultCard("assets/poster/gambar_1.png", MediaQuery.of(context).size.width, "Synchronize Fest 2024", 350, "Gambir Expo Kemayoran, Jakarta Pusat"),
                  ),
                  resultSearchWidgets().resultCard("assets/poster/gambar_2.png", MediaQuery.of(context).size.width, "Java Jazz Festival 2024", 350, "JIExpo Kemayoran, Jakarta Pusat"),
                  resultSearchWidgets().resultCard("assets/poster/gambar_3.png", MediaQuery.of(context).size.width, "Synchronize Fest 2024", 450, "JIExpo Kemayoran, Jakarta Pusat"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

