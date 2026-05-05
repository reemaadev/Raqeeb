import 'package:flutter/material.dart';
import 'items_page.dart';
import 'alerts_notifications_page.dart';
import 'account_management_page.dart';
import 'ble_page.dart';
import 'enable_bluetooth_page.dart';
import 'profile_page.dart';
import 'scan_devices_page.dart';
import 'control_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("رقيب"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: const Text("عدد مرات النسيان"),
                subtitle: const Text("5 مرات هذا الأسبوع"),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications_active, color: Colors.orange),
                title: const Text("الأغراض"),
                subtitle: const Text("3 تنبيهات نشطة"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ItemsPage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications_active, color: Colors.orange),
                title: const Text("التنبيهات والإعدادات"),
                subtitle: const Text("عرض التنبيهات الحالية وتخصيص الإشعارات"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>  AlertsNotificationsPage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_circle, color: Colors.blue),
                title: const Text("إدارة الحساب"),
                subtitle: const Text("تعديل البيانات الشخصية"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AccountManagementPage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.bluetooth, color: Colors.lightBlue),
                title: const Text("Bluetooth"),
                subtitle: const Text("تشغيل البلوتوث واختيار الأجهزة"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const EnableBluetoothPage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.bluetooth_searching, color: Colors.blueAccent),
                title: const Text("BLE Page"),
                subtitle: const Text("اختبار أجهزة البلوتوث"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const BlePage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.purple),
                title: const Text("الملف الشخصي"),
                subtitle: const Text("عرض بيانات المستخدم"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.bluetooth_searching, color: Colors.teal),
                title: const Text("اختيار جهاز البلوتوث"),
                subtitle: const Text("عرض الأجهزة المقترنة"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanDevicesPage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: const Icon(Icons.toggle_on, color: Colors.green),
                title: const Text("التحكم بالجهاز"),
                subtitle: const Text("ON / OFF"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ControlPage(deviceName: "HC-05")));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}