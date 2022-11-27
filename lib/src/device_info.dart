import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:method_channel_demo/src/android_device_info_model.dart';

class DeviceInfo {
  MethodChannel channel =
      const MethodChannel('com.example.method_channel_demo/androidDeviceInfo');

  getAndroidDeviceDetails() async {
    try {
      var details = await channel.invokeMethod('getAndroidDeviceInfo');

      var deviceData = AndroidDeviceInfoModel.fromMap(HashMap.from(details));
      debugPrint("Model:${deviceData.model.toString()}");
      debugPrint("Brand:${deviceData.brand.toString()}");
      debugPrint("Board:${deviceData.board.toString()}");
      debugPrint("Id:${deviceData.id.toString()}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
