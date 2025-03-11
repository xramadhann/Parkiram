// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:parkiram/Models/FilterParkiramModels.dart';

class FilterViewModel extends ChangeNotifier {
  VehicleType? _selectedFilter; // Menyimpan filter yang aktif

  VehicleType? get selectedFilter => _selectedFilter;

  void selectFilter(VehicleType type) {
    if (_selectedFilter == type) {
      _selectedFilter = null;
    } else {
      _selectedFilter = type;
    }
    notifyListeners();
  }
}
