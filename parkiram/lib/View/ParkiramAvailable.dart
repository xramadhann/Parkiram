// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:parkiram/ViewModels/ParkiramAvailableViewModels.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/cupertino.dart';
import 'package:parkiram/Models/LocationParkiramModels.dart';
import 'package:parkiram/View/ParkiramSlot.dart';

class ParkiramAvailable extends StatelessWidget {
  final ParkingModel parking;

  const ParkiramAvailable({super.key, required this.parking});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParkiramAvailableViewModel(parking.title),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 5, 94),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        parking.title,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 246, 255, 0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        parking.address,
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
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              // Gauge Chart
              Consumer<ParkiramAvailableViewModel>(
                builder: (context, viewModel, child) {
                  int used = viewModel.totalSlot -
                      (int.tryParse(viewModel.availableSlot) ?? 0);
                  Color color = used >= 200
                      ? Colors.red
                      : used >= 150
                          ? Colors.orange
                          : used >= 100
                              ? Colors.yellow
                              : used >= 50
                                  ? Colors.lightGreen
                                  : Colors.green;

                  return SfRadialGauge(
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
                            value: used.toDouble(),
                            width: 20,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: color,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.2,
                child: Consumer<ParkiramAvailableViewModel>(
                  builder: (context, viewModel, child) {
                    return Column(
                      children: [
                        Text(
                          viewModel.formattedSlot,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 3, 5, 94),
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
                    );
                  },
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
                                ParkiramSlot(parking: parking),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
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
      ),
    );
  }
}
