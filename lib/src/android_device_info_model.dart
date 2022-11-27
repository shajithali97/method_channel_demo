import 'dart:convert';

AndroidDeviceInfoModel androidDeviceInfoModelFromMap(String str) =>
    AndroidDeviceInfoModel.fromMap(json.decode(str));

String androidDeviceInfoModelToMap(AndroidDeviceInfoModel data) =>
    json.encode(data.toMap());

class AndroidDeviceInfoModel {
  AndroidDeviceInfoModel({
    required this.model,
    required this.id,
    required this.device,
    required this.brand,
    required this.board,
    required this.manufacturer,
  });

  String model;
  String id;
  String device;
  String brand;
  String board;
  String manufacturer;

  factory AndroidDeviceInfoModel.fromMap(Map<dynamic, dynamic> json) =>
      AndroidDeviceInfoModel(
        model: json["model"],
        id: json["id"],
        device: json["device"],
        brand: json["brand"],
        board: json["board"],
        manufacturer: json["manufacturer"],
      );

  Map<String, dynamic> toMap() => {
        "model": model,
        "id": id,
        "device": device,
        "brand": brand,
        "board": board,
        "manufacturer": manufacturer,
      };
}
