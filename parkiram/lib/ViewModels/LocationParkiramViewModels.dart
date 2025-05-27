// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:parkiram/Models/FilterParkiramModels.dart';
import 'package:parkiram/Models/LocationParkiramModels.dart';

class ParkingViewModel extends ChangeNotifier {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  List<ParkingModel> _parkingList = [];
  List<ParkingModel> _filteredParkingList = [];
  String _searchQuery = "";
  VehicleType? _selectedFilter;

  List<ParkingModel> get parkingList => _filteredParkingList;
  String get searchQuery => _searchQuery;
  VehicleType? get selectedFilter => _selectedFilter;

  ParkingViewModel() {
    fetchParkingData();
  }

  void fetchParkingData() {
    _dbRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (data != null && data is Map<dynamic, dynamic>) {
        _parkingList = data.entries.map((entry) {
          debugPrint("Loading parking data: ${entry.key}");
          final parkingData = entry.value as Map<dynamic, dynamic>;
          return ParkingModel.fromMap(parkingData);
        }).toList();
      } else {
        debugPrint("No parking data found");
        _parkingList = [];
      }

      applyFilter(_selectedFilter);
    }, onError: (error) {
      debugPrint("Error fetching parking data: $error");
    });
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
