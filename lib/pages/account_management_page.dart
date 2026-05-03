import 'package:flutter/material.dart';

class AccountManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إدارة الحساب"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("تعديل البيانات الشخصية"),
            leading: Icon(Icons.person),
            onTap: () {
              // إضافة الكود لتعديل البيانات الشخصية هنا
            },
          ),
          ListTile(
            title: Text("تغيير كلمة المرور"),
            leading: Icon(Icons.lock),
            onTap: () {
              // إضافة الكود لتغيير كلمة المرور هنا
            },
          ),
          ListTile(
            title: Text("تسجيل الخروج"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // إضافة الكود لتسجيل الخروج هنا
            },
          ),
        ],
      ),
    );
  }
}
