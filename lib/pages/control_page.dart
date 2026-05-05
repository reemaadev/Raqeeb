// lib/pages/control_page.dart
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  final String deviceName;
  const ControlPage({super.key, required this.deviceName});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  bool isOn = false;

  void togglePower(bool value) {
    setState(() {
      isOn = value;
      // هنا تقدر تضيف كود البلوتوث للتحكم بالجهاز
      // مثال: characteristic.write([value ? 1 : 0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("جهاز: ${widget.deviceName}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => togglePower(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(120, 60),
              ),
              child: const Text("ON"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => togglePower(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(120, 60),
              ),
              child: const Text("OFF"),
            ),
            const SizedBox(height: 30),
            Text(
              "الحالة الحالية: ${isOn ? "تشغيل" : "إيقاف"}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}