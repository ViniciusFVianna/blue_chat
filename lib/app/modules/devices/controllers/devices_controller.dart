import 'dart:async';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class DevicesController extends GetxController {
  StreamSubscription<BluetoothDiscoveryResult>? bluetoothDiscoveryResult;
  Rx<FlutterBluetoothSerial> btSerial = FlutterBluetoothSerial.instance.obs;
  final results = <BluetoothDiscoveryResult>[].obs;
  Rx<bool> isDiscovering = false.obs;

  // @override
  // void onInit() {
  //   btSerial.value.startDiscovery()
  //   // listen((event) {
  //   //   final existingIndex = results.indexWhere(
  //   //           (element) => element.device.address == event.device.address);
  //   //   if (existingIndex >= 0) {
  //   //     results[existingIndex] = event;
  //   //     print(results);
  //   //   } else {
  //   //     results.add(event);
  //   //   }
  //   // });
  //
  //   // bluetoothDiscoveryResult = FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
  //   //     final existingIndex = results.indexWhere(
  //   //             (element) => element.device.address == r.device.address);
  //   //     if (existingIndex >= 0) {
  //   //       results[existingIndex] = r;
  //   //     } else {
  //   //       results.add(r);
  //   //     }
  //   // });
  //
  //   bluetoothDiscoveryResult?.onDone(() {
  //       isDiscovering.value = false;
  //
  //   });
  //   super.onInit();
  // }

  void _startDiscovery() {
    bluetoothDiscoveryResult =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
          print(r.device.name);
            final existingIndex = results.indexWhere(
                    (element) => element.device.address == r.device.address);
            if (existingIndex >= 0) {
              results[existingIndex] = r;
            } else {
              results.add(r);
            }

        });

    bluetoothDiscoveryResult!.onDone(() {
        isDiscovering.value = false;
    });
  }

  @override
  void onReady() {
    _startDiscovery();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
