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
                top: MediaQuery.of(context).size.height * 0.05, // 5% from top
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
                  height:
                      MediaQuery.of(context).size.height * 0.75, // 70% height
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
                top: MediaQuery.of(context).size.height * 0.25, // 20% from top
                child: Center(
                  child: Image.asset(
                    'assets/images/ParkingLot.png',
                    width: MediaQuery.of(context).size.width * 0.9, // 90% width
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
                          top: MediaQuery.of(context).size.height *
                              0.375, // adjusted based on screen height
                          right: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotRight.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA2") &&
                          viewModel.slots["slotA2"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.455, // adjusted based on screen height
                          right: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotRight.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA3") &&
                          viewModel.slots["slotA3"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.540, // adjusted based on screen height
                          right: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotRight.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA4") &&
                          viewModel.slots["slotA4"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.625, // adjusted based on screen height
                          right: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotRight.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA5") &&
                          viewModel.slots["slotA5"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.705, // adjusted based on screen height
                          right: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotRight.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA6") &&
                          viewModel.slots["slotA6"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.375, // adjusted based on screen height
                          left: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA7") &&
                          viewModel.slots["slotA7"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.455, // adjusted based on screen height
                          left: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA8") &&
                          viewModel.slots["slotA8"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.540, // adjusted based on screen height
                          left: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA9") &&
                          viewModel.slots["slotA9"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.625, // adjusted based on screen height
                          left: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
                          child: Image.asset(
                            'assets/images/carLotLeft.png',
                            width: 100,
                          ),
                        ),
                      if (viewModel.slots.containsKey("slotA10") &&
                          viewModel.slots["slotA10"] == "1")
                        Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.705, // adjusted based on screen height
                          left: MediaQuery.of(context).size.width *
                              0.1, // adjusted based on screen width
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
                    width: MediaQuery.of(context).size.width * 0.8, // 80% width
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
