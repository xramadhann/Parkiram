// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:parkiram/ViewModels/ParkiramSlotViewModels.dart';
import 'package:provider/provider.dart';
import 'package:parkiram/Models/LocationParkiramModels.dart';

class ParkiramSlot extends StatelessWidget {
  final ParkingModel parking;

  const ParkiramSlot({super.key, required this.parking});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParkiramSlotViewModel(parking.title),
      child: Scaffold(
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
                        parking.title,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 246, 255, 0),
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
              Consumer<ParkiramSlotViewModel>(
                builder: (context, viewModel, child) {
                  return Stack(
                    children: [
                      if (viewModel.slots.containsKey("slotA1") &&
                          viewModel.slots["slotA1"] == "1")
                        Positioned(
                          top: 310,
                          left: 30,
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA2") &&
                          viewModel.slots["slotA2"] == "1")
                        Positioned(
                          top: 385,
                          left: 30,
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA3") &&
                          viewModel.slots["slotA3"] == "1")
                        Positioned(
                          top: 460,
                          left: 30,
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA4") &&
                          viewModel.slots["slotA4"] == "1")
                        Positioned(
                          top: 533,
                          left: 30,
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA5") &&
                          viewModel.slots["slotA5"] == "1")
                        Positioned(
                          top: 603,
                          left: 30,
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                    ],
                  );
                },
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
      ),
    );
  }
}
