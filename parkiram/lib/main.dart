import 'package:flutter/material.dart';
import 'package:parkiram/HomePage.dart';

void main() {
  runApp(const Parkiram());
}

class Parkiram extends StatelessWidget {
  const Parkiram({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 3, 5, 94)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
