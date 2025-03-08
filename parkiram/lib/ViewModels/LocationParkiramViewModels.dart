// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:parkiram/Models/LocationParkiramModels.dart';

class ParkingViewModel extends ChangeNotifier {
  List<ParkingModel> parkingList = [
    ParkingModel(
      title: "Kalibata City",
      address: "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
      priceFirstHour: "Rp.5000",
      priceNextHour: "Rp.1000",
    ),
    ParkingModel(
      title: "Basurra City",
      address:
          "Jl. Jenderal Basuki Rachmat, Kec. Jatinegara, Kota Jakarta Timur, 13410",
      priceFirstHour: "Rp.3000",
      priceNextHour: "Rp.1000",
    ),
    ParkingModel(
      title: "Plaza Kalibata",
      address: "Jl. Raya Kalibata,Kec. Pancoran,Kota Jakarta Selatan, 12750",
      priceFirstHour: "Rp.3000",
      priceNextHour: "Rp.1000",
    ),
  ];
}
