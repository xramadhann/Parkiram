// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkingCard extends StatelessWidget {
  final String title;
  final String address;
  final String priceFirstHour;
  final String priceNextHour;

  const ParkingCard({
    super.key,
    required this.title,
    required this.address,
    required this.priceFirstHour,
    required this.priceNextHour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 5, 94),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.righteous(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  address,
                  style: GoogleFonts.righteous(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$priceFirstHour/Jam Pertama",
                  style: GoogleFonts.righteous(
                    fontSize: 14,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "*$priceNextHour/Jam Berikutnya",
                  style: GoogleFonts.righteous(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
