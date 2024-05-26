import 'package:flutter/material.dart';

import 'pagesSignedIn/resultSearch.dart';
import 'pagesSignedIn/transaksi.dart';
import 'pagesSignedIn/home.dart';

int selectedIndex = 0;

class overlay extends StatefulWidget {
  const overlay({super.key});

  setIndex(int a) {
    selectedIndex = a;
  }

  @override
  State<overlay> createState() => _overlayState();
}

class _overlayState extends State<overlay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: const <Widget>[
                homess(),
                resultSearch(),
                receipt(),
              ],
            ),
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/outline_home.png"),
              activeIcon: Image.asset("assets/home_coloured.png"),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/search.png"),
              activeIcon: Image.asset("assets/search_select.png"),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/trans_history.png"),
              activeIcon: Image.asset("assets/trans_history_select.png"),
              label: 'Receipt',
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });

            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/search");
              selectedIndex = 0;
            }
          },
          selectedItemColor: Color.fromARGB(255, 221, 180, 34),
          backgroundColor: Color.fromARGB(255, 234, 229, 229),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
