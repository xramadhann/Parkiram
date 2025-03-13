// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ParkiramSlotViewModel extends ChangeNotifier {
  Map<String, String> slots = {};
  late DatabaseReference _databaseRef;

  ParkiramSlotViewModel(String parkingTitle) {
    _fetchData(parkingTitle);
  }

  void _fetchData(String parkingTitle) {
    String parkingPath = parkingTitle.replaceAll(" ", "");
    _databaseRef = FirebaseDatabase.instance.ref("$parkingPath/parkingSlot");

    _databaseRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        Map<dynamic, dynamic> data =
            event.snapshot.value as Map<dynamic, dynamic>;

        slots = data
            .map((key, value) => MapEntry(key.toString(), value.toString()));
        notifyListeners();
      }
    }, onError: (error) {
      debugPrint("Error mengambil data slot parkir: $error");
    });
  }
}
