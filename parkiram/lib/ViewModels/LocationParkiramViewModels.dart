// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:parkiram/Models/FilterParkiramModels.dart';

class ParkingModel {
  final String title;
  final String address;
  final String priceFirstHour;
  final String priceNextHour;
  final List<VehicleType> vehicleTypes;

  ParkingModel({
    required this.title,
    required this.address,
    required this.priceFirstHour,
    required this.priceNextHour,
    required this.vehicleTypes,
  });
}

class ParkingViewModel extends ChangeNotifier {
  List<ParkingModel> _parkingList = [
    ParkingModel(
      title: "Kalibata City",
      address: "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
      priceFirstHour: "Rp.5000",
      priceNextHour: "Rp.1000",
      vehicleTypes: [
        VehicleType.car,
        VehicleType.electricCar,
        VehicleType.truck
      ],
    ),
    ParkingModel(
      title: "Basurra City",
      address:
          "Jl. Jenderal Basuki Rachmat, Kec. Jatinegara, Kota Jakarta Timur, 13410",
      priceFirstHour: "Rp.3000",
      priceNextHour: "Rp.1000",
      vehicleTypes: [
        VehicleType.car,
        VehicleType.electricCar,
        VehicleType.truck
      ],
    ),
    ParkingModel(
      title: "Plaza Kalibata",
      address: "Jl. Raya Kalibata, Kec. Pancoran, Kota Jakarta Selatan, 12750",
      priceFirstHour: "Rp.3000",
      priceNextHour: "Rp.1000",
      vehicleTypes: [
        VehicleType.car,
        VehicleType.electricCar,
        VehicleType.truck
      ],
    ),
  ];

  List<ParkingModel> _filteredParkingList = [];
  String _searchQuery = "";
  VehicleType? _selectedFilter;

  List<ParkingModel> get parkingList => _filteredParkingList;
  String get searchQuery => _searchQuery;
  VehicleType? get selectedFilter => _selectedFilter;

  ParkingViewModel() {
    applyFilter(null);
  }

  void setParkingList(List<ParkingModel> list) {
    _parkingList = list;
    applyFilter(_selectedFilter);
  }

  void applyFilter(VehicleType? selectedFilter) {
    _selectedFilter = selectedFilter;
    _filterResults();
  }

  void searchParking(String query) {
    _searchQuery = query;
    _filterResults();
  }

  void _filterResults() {
    _filteredParkingList = _parkingList.where((parking) {
      bool matchesFilter = (_selectedFilter == null ||
          parking.vehicleTypes.contains(_selectedFilter));
      bool matchesSearch = (_searchQuery.isEmpty ||
          parking.title.toLowerCase().contains(_searchQuery.toLowerCase()));

      return matchesFilter && matchesSearch;
    }).toList();

    notifyListeners();
  }
}
