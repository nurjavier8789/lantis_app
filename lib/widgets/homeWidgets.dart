import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'subWidgets.dart';

class widgetss {
  Text greeting() {
    String teks = "";

    if (DateTime.now().hour >= 00 && DateTime.now().hour <= 11) {
      teks = "Good Morning";
    } else if (DateTime.now().hour >= 12 && DateTime.now().hour <= 17) {
      teks = "Good Afternoon";
    } if (DateTime.now().hour >= 18 && DateTime.now().hour <= 23) {
      teks = "Good Evening";
    }

    return Text(teks, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
  }

  Container TopApp() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: List.filled(1, BoxShadow(color: Colors.black38, blurRadius: 6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          greeting(),
          Row(
            children: [
              Icon(Icons.notifications_none_outlined, size: 26),
              SizedBox(width: 14),
              Icon(Icons.account_circle_outlined, size: 26),
            ],
          ),
        ],
      ),
    );
  }

  Container location() {
    return Container(
      margin: EdgeInsets.only(top: 58),
      padding: EdgeInsets.all(12),
      color: Color.fromARGB(255, 223, 220, 220),
      child: Row(
        children: [
          Icon(Icons.location_on, size: 26),
          SizedBox(width: 12),
          Text("Indonesia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 26),
        ],
      ),
    );
  }

  Container exploreText(double deviceWidth) {
    return Container(
      color: Color.fromARGB(255, 251, 190, 74),
      padding: EdgeInsets.all(8),
      width: deviceWidth,
      child: Text("Explore Events", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
    );
  }

  Container kategori() {
    return Container(
      height: 52,
      margin: EdgeInsets.all(2),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(top: 12, left: 12, right: 10, bottom: 16),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 44, 69, 133), width: 2),
              borderRadius: BorderRadius.circular(69),
            ),
            child: Text("Semua Event", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color.fromARGB(255, 44, 69, 133))),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 10, bottom: 16),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 187, 187, 187), width: 2),
              borderRadius: BorderRadius.circular(69),
            ),
            child: Text("Konser Musik", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 10, bottom: 16),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 187, 187, 187), width: 2),
              borderRadius: BorderRadius.circular(69),
            ),
            child: Text("Seni Rupa", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 10, bottom: 16),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 187, 187, 187), width: 2),
              borderRadius: BorderRadius.circular(69),
            ),
            child: Text("Talk Show", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 10, bottom: 16),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 187, 187, 187), width: 2),
              borderRadius: BorderRadius.circular(69),
            ),
            child: Text("Webinar", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 10, bottom: 16),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 187, 187, 187), width: 2),
              borderRadius: BorderRadius.circular(69),
            ),
            child: Text("Seminar", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Container eventCards(double deviceWidth) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(0, 0.88),
          colors: [Color(0x00003049), Color(0xFF003049)],
        ),
      ),
      child: Column(
        children: [
          subWidgetss().eventCard("assets/card/card_0.png", "GWK BALI COUNTDOWN", "GWK Cultural Park, Bali", "Rp150.000 - Rp550.000", deviceWidth),
          subWidgetss().eventCard("assets/card/card_1.png", "JAVA JAZZ FESTIVAL", "JIExpo Kemayoran, Jakarta Pusat", "Rp350.000 - Rp1.525.000", deviceWidth),
          subWidgetss().eventCard("assets/card/card_2.png", "PESTA PORA", "JIExpo Kemayoran, Jakarta Pusat", "Rp450.000", deviceWidth),
          subWidgetss().eventCard("assets/card/card_3.png", "JAK-JAPAN MATSURI", "JIExpo Kemayoran, Jakarta Pusat", "Rp90.000 - Rp190.000", deviceWidth),
          subWidgetss().eventCard("assets/card/card_4.png", "INDONESIA INTERNATIONAL MOTOR SHOW", "JIExpo Kemayoran, Jakarta Pusat", "Rp50.000 - Rp185.000", deviceWidth),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4, right: 10, left: 10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color.fromARGB(255, 251, 190, 74)),
            ),
            child: Text("Lihat lebih banyak", style: TextStyle(color: Color.fromARGB(255, 251, 190, 74))),
          ),
        ],
      ),
    );
  }

  Container videoSection() {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Video", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          SizedBox(height: 10),
          Text("Trailer, wawancara, dan lainnya!", style: TextStyle(color: Color.fromARGB(255, 123, 123, 123))),
          SizedBox(height: 16),
          Container(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                subWidgetss().videoList("assets/videos/video_0.png", "OFFICIAL AFTER MOVIE PESTAPORA 2023 - PRESEN...", 569, "31 Des 2023", 269),
                subWidgetss().videoList("assets/videos/video_1.png", "Synchronize Fest 2024 : Line-Up Anouncement Phase 1", 632, "28 Des 2023", 331),
                subWidgetss().videoList("assets/videos/video_2.png", "The Jakarta International Java Jazz Festival Is Set to Return...", 123, "27 Nov 2023", 45),
                subWidgetss().videoList("assets/videos/video_3.png", "Festival Pemersatu Rakyat bersama Kiki Aulia Ucup | ...", 167, "27 Sep 2023", 23),
                subWidgetss().videoList("assets/videos/video_4.png", "WELCOME TO PESTAPORA BARENG IM3🍎🍊🍋🍋🍌🍌", 126, "21 Sep 2023", 36),
                subWidgetss().videoList("assets/videos/video_5.png", "Sesi Wawancara - Press Conference PESTAPORA 2023", 10, "21 Sep 2023", 3),
                subWidgetss().videoList("assets/videos/video_6.png", "Behind Synchronize Fest 2023!!. Saksikan IKUT ...", 132, "9 Sep 2023", 12),
                subWidgetss().videoList("assets/videos/video_7.png", "LINE UP PESTAPORA 2023 🍓🍇🍉", 457, "24 Jul 2023", 230),
                subWidgetss().videoList("assets/videos/video_8.png", "APA ITU SPECIAL LINEUP SYNCHRONIZE FEST 2023?", 324, "24 Jul 2023", 120),
                subWidgetss().videoList("assets/videos/video_9.png", "Jakarta International BNI Java Jazz Festival 2023 | Official...", 545, "10 Jul 2023", 211),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column footerHome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/name_text.png", height: 40),
        SizedBox(height: 8),
        Text("Portal Tiket Event Terdepan di Indonesia", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
        SizedBox(height: 24),
        Text("Our Social Media:"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse('https://www.instagram.com/kyooshees/'), mode: LaunchMode.externalApplication);
              },
              child: Image.asset("assets/ig.png", width: 30),
            ),
            SizedBox(width: 40),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse('https://twitter.com/PostsOfCats/status/1785658950358028585'), mode: LaunchMode.externalApplication);
              },
              child: Image.asset("assets/twitter.png", width: 30),
            ),
            SizedBox(width: 40),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse('https://www.tiktok.com/@kyoo.69?_t=8jAG5K2Jhjd&_r=1'), mode: LaunchMode.externalApplication);
              },
              child: Image.asset("assets/tiktok.png", width: 30),
            ),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }
}