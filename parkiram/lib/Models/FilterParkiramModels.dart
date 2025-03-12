// ignore_for_file: file_names

enum VehicleType { car, electricCar, scooter, bicycle, bus, truck }

class FilterModel {
  final VehicleType type;
  final String imagePath;

  FilterModel({required this.type, required this.imagePath});
}

List<FilterModel> vehicleFilters = [
  FilterModel(
      type: VehicleType.car, imagePath: 'assets/images/IconFilter/car1.png'),
  FilterModel(
      type: VehicleType.electricCar,
      imagePath: 'assets/images/IconFilter/electric-car1.png'),
  FilterModel(
      type: VehicleType.scooter,
      imagePath: 'assets/images/IconFilter/scooter1.png'),
  FilterModel(
      type: VehicleType.bicycle,
      imagePath: 'assets/images/IconFilter/bicycle1.png'),
  FilterModel(
      type: VehicleType.bus, imagePath: 'assets/images/IconFilter/bus1.png'),
  FilterModel(
      type: VehicleType.truck,
      imagePath: 'assets/images/IconFilter/truck1.png'),
];
