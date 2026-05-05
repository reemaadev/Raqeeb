// lib/pages/scan_devices_page.dart
import 'package:flutter/material.dart';
import 'control_page.dart';

class ScanDevicesPage extends StatelessWidget {
  const ScanDevicesPage({super.key});

  final List<String> pairedDevices = const [
    'HC-05',
    'Device_1',
    'Device_2',
  ]; // مثال للأجهزة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("اختيار الجهاز")),
      body: ListView.builder(
        itemCount: pairedDevices.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.bluetooth),
            title: Text(pairedDevices[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ControlPage(deviceName: pairedDevices[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}