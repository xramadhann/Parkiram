// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkiram/Models/FilterParkiramModels.dart';
import 'package:parkiram/View/ParkiramAvailable.dart';
import 'package:parkiram/ViewModels/FilterParkiramViewModels.dart';
import 'package:parkiram/Widget/LocationParkiramWidget.dart';
import 'package:provider/provider.dart';
import 'package:parkiram/ViewModels/LocationParkiramViewModels.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ParkingViewModel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 3, 5, 94),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: double.infinity,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Selamat Datang di,",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "PARKIRAM",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 48,
                  right: 20,
                  child: Image.asset(
                    "assets/images/Logo/LogoPutihBiru.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    height: 120,
                    child: Consumer<FilterViewModel>(
                      builder: (context, filterViewModel, child) {
                        return GridView.count(
                          crossAxisCount: 6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children:
                              List.generate(vehicleFilters.length, (index) {
                            final filter = vehicleFilters[index];
                            bool isSelected =
                                filterViewModel.selectedFilter == filter.type;

                            return GestureDetector(
                              onTap: () {
                                filterViewModel.selectFilter(filter.type);
                                Provider.of<ParkingViewModel>(context,
                                        listen: false)
                                    .applyFilter(
                                        filterViewModel.selectedFilter);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelected
                                      ? const Color.fromARGB(255, 246, 255, 0)
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    filter.imagePath,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 270,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    height: 45,
                    child: Consumer<ParkingViewModel>(
                      builder: (context, parkingViewModel, child) {
                        return TextField(
                          onChanged: (value) =>
                              parkingViewModel.searchParking(value),
                          style: GoogleFonts.righteous(
                            color: const Color.fromARGB(255, 3, 5, 94),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Cari tempat parkir...",
                            hintStyle: GoogleFonts.righteous(
                              color: const Color.fromARGB(132, 3, 5, 94),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Icons.search, size: 24),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 550,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PARKIRAM Tersedia",
                          style: GoogleFonts.righteous(
                            fontSize: 24,
                            color: const Color.fromARGB(255, 3, 5, 94),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Consumer<ParkingViewModel>(
                            builder: (context, parkingViewModel, child) {
                              if (parkingViewModel.parkingList.isEmpty) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/IconFilter/noservice.gif',
                                        width: 150,
                                        height: 150,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        parkingViewModel.searchQuery.isNotEmpty
                                            ? "Parkiram tidak ditemukan"
                                            : (parkingViewModel
                                                        .selectedFilter !=
                                                    null
                                                ? "Belum ada Parkiram untuk kendaraan ini"
                                                : "Tidak ada layanan Parkiram saat ini"),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 3, 5, 94),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }

                              return ListView.builder(
                                itemCount: parkingViewModel.parkingList.length,
                                itemBuilder: (context, index) {
                                  final parking =
                                      parkingViewModel.parkingList[index];
                                  return ParkingCard(
                                    title: parking.title,
                                    address: parking.address,
                                    priceFirstHour: parking.priceFirstHour,
                                    priceNextHour: parking.priceNextHour,
                                    availableSlot:
                                        parking.parkingSlot.availableSlot,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ParkiramAvailable(
                                                  parking: parking),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
