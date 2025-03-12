// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ParkiramAvailable extends StatefulWidget {
  const ParkiramAvailable({super.key});

  @override
  State<ParkiramAvailable> createState() => _ParkiramAvailableState();
}

class _ParkiramAvailableState extends State<ParkiramAvailable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 5, 94),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
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
                  maximum: 100, // Maksimal 100%
                  startAngle: 90, // Mulai dari atas (0°)
                  endAngle: 450, // Lingkaran penuh (360°)
                  radiusFactor: 0.8, // Ukuran gauge
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 20,
                    color: Color.fromRGBO(
                        228, 228, 228, 1), // Warna background gauge
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
                      value: 20, // Nilai pertama (20%)
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
                children: const [
                  Text(
                    "10/200",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 3, 5, 94),
                    ),
                  ),
                  Text(
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
          ],
        ),
      ),
    );
  }
}
