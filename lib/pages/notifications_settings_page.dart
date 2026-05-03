import 'package:flutter/material.dart';

class NotificationsSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إعدادات الإشعارات"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text("تنبيهات الرسائل"),
            value: true, // يمكنك تغيير القيمة هنا حسب الحاجة
            onChanged: (bool value) {
              // إضافة الكود لتفعيل أو تعطيل التنبيهات هنا
            },
          ),
          SwitchListTile(
            title: Text("تنبيهات التحديثات"),
            value: false, // يمكنك تغيير القيمة هنا حسب الحاجة
            onChanged: (bool value) {
              // إضافة الكود لتفعيل أو تعطيل التنبيهات هنا
            },
          ),
        ],
      ),
    );
  }
}
