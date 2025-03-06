import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                // TextField Search
                Positioned(
                  top: 200,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    height: 45,
                    child: TextField(
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
                        hintText: "Yuk cari PARKIRAM terdekat",
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
                            const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),

                // Container Putih
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

                        // ListView untuk menampilkan daftar parkiran
                        Expanded(
                          child: ListView(
                            children: const [
                              ParkingCard(
                                title: "Kalibata City",
                                address:
                                    "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
                                priceFirstHour: "Rp.5000",
                                priceNextHour: "Rp.1000",
                              ),
                              ParkingCard(
                                title: "Basurra City",
                                address:
                                    "Jl. Jenderal Basuki Rachmat, Kec. Jatinegara, Kota Jakarta Timur, 13410",
                                priceFirstHour: "Rp.3000",
                                priceNextHour: "Rp.1000",
                              ),
                              ParkingCard(
                                title: "Plaza Kalibata",
                                address:
                                    "Jl. Raya Kalibata,Kec. Pancoran,Kota Jakarta Selatan, 12750",
                                priceFirstHour: "Rp.3000",
                                priceNextHour: "Rp.1000",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Header
                Positioned(
                  top: 40,
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

                // Logo
                Positioned(
                  top: 28,
                  right: 20,
                  child: Image.asset(
                    'assets/images/LogoPutihBiru.png',
                    height: 80,
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

// Widget untuk menampilkan kartu parkiran
class ParkingCard extends StatelessWidget {
  final String title;
  final String address;
  final String priceFirstHour;
  final String priceNextHour;

  const ParkingCard({
    super.key,
    required this.title,
    required this.address,
    required this.priceFirstHour,
    required this.priceNextHour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 5, 94),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.righteous(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  address,
                  style: GoogleFonts.righteous(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$priceFirstHour/Jam Pertama",
                  style: GoogleFonts.righteous(
                    fontSize: 14,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "+$priceNextHour/Jam Berikutnya",
                  style: GoogleFonts.righteous(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/Logo.png',
                width: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
