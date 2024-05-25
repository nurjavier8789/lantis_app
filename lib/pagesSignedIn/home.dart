import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../function/widgets.dart';

class homess extends StatefulWidget {
  const homess({super.key});

  @override
  State<homess> createState() => _homessState();
}

class _homessState extends State<homess> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  carousel() {
    return Column(
      children: [
        Container(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
              height: 174,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: [
              Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 69, 133), width: 4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/poster/gambar_1.png"),
              ),
              Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 69, 133), width: 4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/poster/gambar_2.png"),
              ),
              Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 69, 133), width: 4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/poster/gambar_3.png"),
              ),
              Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 69, 133), width: 4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/poster/gambar_4.png"),
              ),
              Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 69, 133), width: 4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/poster/gambar_5.png"),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _current == 0 ? 8 : 6,
              height: _current == 0 ? 8 : 6,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == 0 ? Color.fromARGB(255, 0, 48, 73) : Color.fromARGB(255, 251, 190, 74)
              ),
            ),
            Container(
              width: _current == 1 ? 8 : 6,
              height: _current == 1 ? 8 : 6,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == 1 ? Color.fromARGB(255, 0, 48, 73) : Color.fromARGB(255, 251, 190, 74)
              ),
            ),
            Container(
              width: _current == 2 ? 8 : 6,
              height: _current == 2 ? 8 : 6,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == 2 ? Color.fromARGB(255, 0, 48, 73) : Color.fromARGB(255, 251, 190, 74)
              ),
            ),
            Container(
              width: _current == 3 ? 8 : 6,
              height: _current == 3 ? 8 : 6,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == 3 ? Color.fromARGB(255, 0, 48, 73) : Color.fromARGB(255, 251, 190, 74)
              ),
            ),
            Container(
              width: _current == 4 ? 8 : 6,
              height: _current == 4 ? 8 : 6,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == 4 ? Color.fromARGB(255, 0, 48, 73) : Color.fromARGB(255, 251, 190, 74)
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          widgetss().location(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("Special Events for you", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              ),
              carousel(),
              SizedBox(height: 12),
              widgetss().exploreText(MediaQuery.of(context).size.width),
              widgetss().kategori(),
              widgetss().eventCards(MediaQuery.of(context).size.width),
              widgetss().videoSection(),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 64),
              widgetss().footerHome(),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.linear);
                  },
                  child: Text("Back to top", style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 2, 48, 73))),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ],
      ),
    );
  }
}

