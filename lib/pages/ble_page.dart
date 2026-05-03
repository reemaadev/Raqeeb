import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BlePage extends StatefulWidget {
  const BlePage({super.key});

  @override
  State<BlePage> createState() => _BlePageState();
}

class _BlePageState extends State<BlePage> {
  BluetoothDevice? device;
  BluetoothCharacteristic? characteristic;

  void scan() {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      for (var r in results) {
        if (r.device.name == "Raqeeb_Device") {
          device = r.device;
          FlutterBluePlus.stopScan();
          connect();
        }
      }
    });
  }

  void connect() async {
    await device!.connect();

    var services = await device!.discoverServices();

    for (var s in services) {
      for (var c in s.characteristics) {
        characteristic = c;
      }
    }
  }

  void send(String value) {
    characteristic?.write(value.codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLE Control")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: scan,
              child: const Text("Connect"),
            ),
            ElevatedButton(
              onPressed: () => send("on"),
              child: const Text("ON"),
            ),
            ElevatedButton(
              onPressed: () => send("off"),
              child: const Text("OFF"),
            ),
          ],
        ),
      ),
    );
  }
}
