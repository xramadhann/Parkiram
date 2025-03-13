import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkiram/View/HomePage.dart';
import 'package:parkiram/View/ParkiramAvailable.dart';
import 'package:parkiram/View/ParkiramSlot.dart';
import 'package:parkiram/ViewModels/FilterParkiramViewModels.dart';
import 'package:provider/provider.dart';

import 'ViewModels/LocationParkiramViewModels.dart';

void main() {
  runApp(const Parkiram());
}

class Parkiram extends StatelessWidget {
  const Parkiram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ParkingViewModel()),
        ChangeNotifierProvider(create: (context) => FilterViewModel()),
      ],
      child: MaterialApp(
        title: 'Parkiram App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 3, 5, 94),
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.righteousTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        // home: const ParkiramAvailable(),
        home: const ParkiramSlot(),
      ),
    );
  }
}
