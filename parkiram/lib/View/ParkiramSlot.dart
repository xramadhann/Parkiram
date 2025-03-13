// ignore_for_file: file_names, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ParkiramSlot extends StatefulWidget {
  const ParkiramSlot({super.key});

  @override
  State<ParkiramSlot> createState() => _ParkiramSlotState();
}

class _ParkiramSlotState extends State<ParkiramSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 5, 94),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 45,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(),
                child: Column(
                  children: const [
                    Text(
                      "Plaza Kalibata",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 246, 255, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 246, 255, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 700,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Center(
                child: Image.asset(
                  'assets/images/ParkingLot.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 5, 94),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "KEMABALI",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
