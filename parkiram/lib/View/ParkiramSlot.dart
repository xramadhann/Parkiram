// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:parkiram/Models/LocationParkiramModels.dart';

class ParkiramSlot extends StatefulWidget {
  final ParkingModel parking;

  const ParkiramSlot({super.key, required this.parking});

  @override
  _ParkiramSlotState createState() => _ParkiramSlotState();
}

class _ParkiramSlotState extends State<ParkiramSlot> {
  late DatabaseReference _databaseRef;
  Map<String, String> _slots = {};

  @override
  void initState() {
    super.initState();

    String parkingPath = widget.parking.title.replaceAll(" ", "");
    _databaseRef = FirebaseDatabase.instance.ref("$parkingPath/parkingSlot");

    _databaseRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        Map<dynamic, dynamic> data =
            event.snapshot.value as Map<dynamic, dynamic>;

        setState(() {
          _slots = data
              .map((key, value) => MapEntry(key.toString(), value.toString()));
        });

        debugPrint("Data slot parkir diperbarui untuk $parkingPath: $_slots");
      } else {
        debugPrint("Tidak ada data parkir tersedia untuk $parkingPath.");
      }
    }, onError: (error) {
      debugPrint("Error mengambil data parkir: $error");
    });
  }

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
                child: Column(
                  children: [
                    Text(
                      widget.parking.title,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 246, 255, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.parking.address,
                      style: const TextStyle(
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
            if (_slots.containsKey("slotA1") && _slots["slotA1"] == "1")
              Positioned(
                top: 310,
                left: 30,
                child: Image.asset(
                  'assets/images/carLotLeft.png',
                  width: 100,
                ),
              ),
            if (_slots.containsKey("slotA2") && _slots["slotA2"] == "1")
              Positioned(
                top: 385,
                left: 30,
                child: Image.asset(
                  'assets/images/carLotLeft.png',
                  width: 100,
                ),
              ),
            if (_slots.containsKey("slotA3") && _slots["slotA3"] == "1")
              Positioned(
                top: 460,
                left: 30,
                child: Image.asset(
                  'assets/images/carLotLeft.png',
                  width: 100,
                ),
              ),
            Positioned(
              bottom: 50,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 3, 5, 94),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      "KEMBALI",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
