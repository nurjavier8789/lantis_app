import 'package:flutter/material.dart';

import '../widgets/searchWidgets.dart';
import '../overlay.dart';
import 'resultSearch.dart';

final searchInput = TextEditingController();
int curentIndex = 0;

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  lastSearch() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    curentIndex = 0;
                  });
                },
                splashColor: Color.fromARGB(0, 0, 0, 0),
                highlightColor: Color.fromARGB(0, 0, 0, 0),
                child: Text("< Back", style: TextStyle(fontSize: 14)),
              ),
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
        ],
      ),
    );
  }

  Column historyLast() {
    InkWell seeMore() {
      return InkWell(
        onTap: () {
          setState(() {
            curentIndex = 1;
          });
        },
        splashColor: Color.fromARGB(0, 0, 0, 0),
        highlightColor: Color.fromARGB(0, 0, 0, 0),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 243, 255),
            border: Border.all(color: Color.fromARGB(255, 44, 149, 241)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text("See More", style: TextStyle(color: Color.fromARGB(255, 44, 149, 241), fontWeight: FontWeight.w600, fontSize: 18)),
        ),
      );
    }

    return Column(
      children: [
        searchWidget().lastSeen(),
        searchWidget().history(seeMore()),
        searchWidget().popular(),
      ],
    );
  }

  @override
  void dispose() {
    if (searchInput.text.isNotEmpty) {
      searchInput.clear();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchWidget().topBar(context),

              Form(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 241, 241, 241),
                  ),
                  child: TextFormField(
                    controller: searchInput,
                    onFieldSubmitted: (value) {
                      overlay().setIndex(1);
                      resultSearch().setTextInput(value);
                      print("User pressed enter with value: $value");
                      Navigator.pushReplacementNamed(context, "/overlay");
                    },
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

              IndexedStack(
                index: curentIndex,
                children: [
                  historyLast(),
                  lastSearch(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
