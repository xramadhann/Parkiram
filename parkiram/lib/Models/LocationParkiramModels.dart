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

  // Factory method untuk membuat objek dari Firebase data snapshot
  factory ParkingModel.fromMap(Map<dynamic, dynamic> data) {
    return ParkingModel(
      title: data['title'] ?? '',
      address: data['address'] ?? '',
      priceFirstHour: data['priceFirstHour'] ?? '',
      priceNextHour: data['priceNextHour'] ?? '',
      vehicleTypes: (data['vehicleTypes'] as List<dynamic>?)
              ?.map((e) => VehicleType.values.firstWhere(
                    (type) => type.toString().split('.').last == e,
                    orElse: () => VehicleType.car,
                  ))
              .toList() ??
          [],
    );
  }
}
