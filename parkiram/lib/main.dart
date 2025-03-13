import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkiram/View/HomePage.dart';
import 'package:parkiram/ViewModels/FilterParkiramViewModels.dart';
import 'package:parkiram/ViewModels/LocationParkiramViewModels.dart';
import 'package:parkiram/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase initialization error: $e");
  }

  runApp(const Parkiram());
}

class Parkiram extends StatelessWidget {
  const Parkiram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParkingViewModel()),
        ChangeNotifierProvider(create: (_) => FilterViewModel()),
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
        home: const HomePage(),
      ),
    );
  }
}
