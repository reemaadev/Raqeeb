import 'package:flutter/material.dart';
import 'items_page.dart';
import 'alerts_notifications_page.dart'; // دمج التنبيهات والإعدادات في صفحة واحدة
import 'account_management_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("رقيب"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                title: const Text("عدد مرات النسيان"),
                subtitle: const Text("5 مرات هذا الأسبوع"),
              ),
            ),

            const SizedBox(height: 15),

            // الانتقال لصفحة الأغراض
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.notifications_active,
                  color: Colors.orange,
                ),
                title: const Text("الأغراض"), // تم تغيير النص هنا
                subtitle: const Text("3 تنبيهات نشطة"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemsPage(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // الانتقال لصفحة التنبيهات والإعدادات (دمج التنبيهات والإعدادات في صفحة واحدة)
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.notifications_active,
                  color: Colors.orange,
                ),
                title: const Text("التنبيهات والإعدادات"),
                subtitle: const Text("عرض التنبيهات الحالية وتخصيص الإشعارات"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AlertsNotificationsPage(), // التنقل إلى صفحة التنبيهات والإعدادات
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // الانتقال لصفحة إدارة الحساب
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.blue,
                ),
                title: const Text("إدارة الحساب"),
                subtitle: const Text("تعديل البيانات الشخصية"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AccountManagementPage(), // التنقل إلى صفحة إدارة الحساب
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
