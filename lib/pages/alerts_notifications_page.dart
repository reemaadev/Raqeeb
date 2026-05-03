import 'package:flutter/material.dart';

class AlertsNotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التنبيهات والإعدادات"),
      ),
      body: ListView(
        children: [
          // عرض التنبيهات
          ListTile(
            title: Text("تنبيه 1"),
            subtitle: Text("هذا هو التنبيه الأول."),
            trailing: Icon(Icons.notifications),
          ),
          ListTile(
            title: Text("تنبيه 2"),
            subtitle: Text("هذا هو التنبيه الثاني."),
            trailing: Icon(Icons.notifications),
          ),

          // فاصل بين التنبيهات والإعدادات
          Divider(),

          // إعدادات التنبيهات
          SwitchListTile(
            title: Text("تمكين التنبيهات"),
            value: true, // القيمة التي تحدد حالة التنبيه
            onChanged: (bool value) {
              // إضافة الكود لتفعيل أو تعطيل التنبيهات هنا
            },
          ),
          SwitchListTile(
            title: Text("إظهار التنبيهات عند التحديثات"),
            value: false, // القيمة التي تحدد حالة التنبيه
            onChanged: (bool value) {
              // إضافة الكود لتغيير إعدادات التنبيهات هنا
            },
          ),
        ],
      ),
    );
  }
}