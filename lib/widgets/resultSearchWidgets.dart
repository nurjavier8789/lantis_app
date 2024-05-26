import 'package:flutter/material.dart';

class resultSearchWidgets {
  Container filterThing(String name) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      margin: const EdgeInsets.only(right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 241, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(name, style: const TextStyle(color: Color.fromARGB(255, 92, 173, 244))),
    );
  }

  Container resultCard(String filePath, double widthPhone, String nama, int harga, String lokasi) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Image.asset(filePath, fit: BoxFit.fitWidth, width: widthPhone),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(nama, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text("Rp", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 254, 196, 32))),
                  Text("${harga}K", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: Color.fromARGB(255, 85, 200, 95)),
              SizedBox(width: 3),
              Text(lokasi, style: TextStyle(color: Color.fromARGB(255, 112, 118, 123), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}