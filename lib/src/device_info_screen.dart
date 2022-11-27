import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:method_channel_demo/src/device_info.dart';

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Info"),
      ),
      body: Center(
          child: Platform.isAndroid
              ? ElevatedButton(
                  onPressed: () {
                    DeviceInfo info = DeviceInfo();
                    info.getAndroidDeviceDetails();
                  },
                  child: Text("Get Android Device Info"))
              : Text("Device data get only for android device")),
    );
  }
}
