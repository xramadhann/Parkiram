import 'package:flutter/material.dart';
import 'package:parkiram/Models/FilterParkiramModels.dart';

class ParkingModel {
  final String title;
  final String address;
  final String priceFirstHour;
  final String priceNextHour;
  final VehicleType vehicleType;

  ParkingModel({
    required this.title,
    required this.address,
    required this.priceFirstHour,
    required this.priceNextHour,
    required this.vehicleType,
  });
}

class ParkingViewModel extends ChangeNotifier {
  List<ParkingModel> _parkingList = [
    ParkingModel(
      title: "Kalibata City",
      address: "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
      priceFirstHour: "Rp.5000",
      priceNextHour: "Rp.1000",
      vehicleType: VehicleType.bus,
    ),
    ParkingModel(
      title: "Basurra City",
      address:
          "Jl. Jenderal Basuki Rachmat, Kec. Jatinegara, Kota Jakarta Timur, 13410",
      priceFirstHour: "Rp.3000",
      priceNextHour: "Rp.1000",
      vehicleType: VehicleType.car,
    ),
    ParkingModel(
      title: "Plaza Kalibata",
      address: "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
      priceFirstHour: "Rp.3000",
      priceNextHour: "Rp.1000",
      vehicleType: VehicleType.car,
    ),
  ];

  List<ParkingModel> _filteredParkingList = [];

  List<ParkingModel> get parkingList => _filteredParkingList;

  ParkingViewModel() {
    applyFilter(null); // ✅ Tambahkan ini agar list langsung muncul
  }

  void setParkingList(List<ParkingModel> list) {
    _parkingList = list;
    applyFilter(null); // ✅ Pastikan list tetap muncul setelah diupdate
  }

  void applyFilter(VehicleType? selectedFilter) {
    if (selectedFilter == null) {
      _filteredParkingList =
          List.from(_parkingList); // ✅ Tampilkan semua parkiran
    } else {
      _filteredParkingList = _parkingList
          .where((parking) => parking.vehicleType == selectedFilter)
          .toList();
    }
    notifyListeners();
  }
}
