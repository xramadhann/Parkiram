// ignore_for_file: file_names

class ParkingSlot {
  final String availableSlot;
  final Map<String, String> slots;

  ParkingSlot({
    required this.availableSlot,
    required this.slots,
  });

  factory ParkingSlot.fromMap(Map<dynamic, dynamic> data) {
    return ParkingSlot(
      availableSlot: data['availableSlot'] ?? '0',
      slots: Map<String, String>.from(data)..remove('availableSlot'),
    );
  }
}
