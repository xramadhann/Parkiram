// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ParkiramAvailableViewModel extends ChangeNotifier {
  String availableSlot = "0";
  late DatabaseReference _databaseRef;

  ParkiramAvailableViewModel(String parkingTitle) {
    _fetchData(parkingTitle);
  }

  void _fetchData(String parkingTitle) {
    String parkingPath = parkingTitle.replaceAll(" ", "");
    _databaseRef =
        FirebaseDatabase.instance.ref("$parkingPath/parkingSlot/availableSlot");

    _databaseRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        availableSlot = event.snapshot.value.toString();
        notifyListeners();
      }
    }, onError: (error) {
      debugPrint("Error mengambil data slot: $error");
    });
  }
}
