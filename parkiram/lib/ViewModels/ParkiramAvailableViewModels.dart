// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ParkiramAvailableViewModel extends ChangeNotifier {
  String availableSlot = "0";
  String recommendedSlot = "-";
  final int totalSlot = 200;

  late DatabaseReference _availableSlotRef;
  late DatabaseReference _recommendedSlotRef;

  ParkiramAvailableViewModel(String parkingTitle) {
    _fetchData(parkingTitle);
  }

  void _fetchData(String parkingTitle) {
    String parkingPath = parkingTitle.replaceAll(" ", "");

    // Reference untuk availableSlot
    _availableSlotRef =
        FirebaseDatabase.instance.ref("$parkingPath/parkingSlot/availableSlot");

    // Reference untuk recommendedSlot
    _recommendedSlotRef = FirebaseDatabase.instance
        .ref("$parkingPath/parkingSlot/recommendedSlot");

    // Listener untuk availableSlot
    _availableSlotRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        availableSlot = event.snapshot.value.toString();
        notifyListeners();
      }
    }, onError: (error) {
      debugPrint("Error mengambil data availableSlot: $error");
    });

    // Listener untuk recommendedSlot
    _recommendedSlotRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        recommendedSlot = event.snapshot.value.toString();
        notifyListeners();
      }
    }, onError: (error) {
      debugPrint("Error mengambil data recommendedSlot: $error");
    });
  }

  String get formattedSlot {
    int parsedAvailable = int.tryParse(availableSlot) ?? 0;
    int used = totalSlot - parsedAvailable;
    return "$used/$totalSlot";
  }
}
