import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<BluetoothState> bluetoothState = BluetoothState.UNKNOWN.obs;
  Rx<String> address = "".obs;
  Rx<String> name = "".obs;

  @override
  void onInit() {
    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
        bluetoothState.value = state;
    });

    FlutterBluetoothSerial.instance.address.then((addresss) {
      address.value = addresss!;

  });

  FlutterBluetoothSerial.instance.name.then((namee) {
  name.value = namee!;
  });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    super.onClose();
  }

}
