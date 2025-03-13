// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:parkiram/Models/LocationParkiramModels.dart';
import 'package:parkiram/View/ParkiramSlot.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/cupertino.dart';

class ParkiramAvailable extends StatefulWidget {
  final ParkingModel parking;

  const ParkiramAvailable({super.key, required this.parking});

  @override
  _ParkiramAvailableState createState() => _ParkiramAvailableState();
}

class _ParkiramAvailableState extends State<ParkiramAvailable> {
  late DatabaseReference _databaseRef;
  String _availableSlot = "0";

  @override
  void initState() {
    super.initState();

    String parkingPath = widget.parking.title.replaceAll(" ", "");
    _databaseRef =
        FirebaseDatabase.instance.ref("$parkingPath/parkingSlot/availableSlot");

    _databaseRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        setState(() {
          _availableSlot = event.snapshot.value.toString();
        });

        debugPrint("Data slot tersedia diperbarui: $_availableSlot");
      } else {
        debugPrint("Tidak ada data slot tersedia.");
      }
    }, onError: (error) {
      debugPrint("Error mengambil data slot tersedia: $error");
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
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 200,
                  startAngle: 90,
                  endAngle: 450,
                  radiusFactor: 0.8,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 20,
                    color: Color.fromRGBO(228, 228, 228, 1),
                    thicknessUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0,
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Image(
                            image: AssetImage("assets/images/car.png"),
                            height: 180,
                          ),
                        ],
                      ),
                    ),
                  ],
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: double.tryParse(_availableSlot) ??
                          0, // Slot tersedia diubah secara real-time
                      width: 20,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                      color: const Color.fromARGB(255, 246, 255, 0),
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 180,
              child: Column(
                children: [
                  Text(
                    "$_availableSlot/200",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 3, 5, 94),
                    ),
                  ),
                  const Text(
                    "Tersedia",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 3, 5, 94),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 3, 5, 94),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.arrow_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ParkiramSlot(parking: widget.parking),
                        ),
                      );
                    },
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 3, 5, 94),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          "LIHAT PARKIRAM",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
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
