import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class EnableBluetoothPage extends StatefulWidget {
  const EnableBluetoothPage({super.key});

  @override
  State<EnableBluetoothPage> createState() => _EnableBluetoothPageState();
}

class _EnableBluetoothPageState extends State<EnableBluetoothPage> {
  List<ScanResult> devices = [];
  bool isScanning = false;

  void scanDevices() async {
    setState(() {
      devices.clear();
      isScanning = true;
    });

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        devices = results;
      });
    });

    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      isScanning = false;
    });

    FlutterBluePlus.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Devices"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: scanDevices,
            child: Text(isScanning ? "Scanning..." : "Scan Devices"),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index].device;

                return ListTile(
                  title: Text(
                    device.platformName.isEmpty
                        ? "Unknown Device"
                        : device.platformName,
                  ),
                  subtitle: Text(device.remoteId.toString()),
                  leading: const Icon(Icons.bluetooth),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
