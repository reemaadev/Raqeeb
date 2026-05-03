import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Item {
  String name;
  String? device;

  Item({required this.name, this.device});

  Map<String, dynamic> toJson() => {
        'name': name,
        'device': device,
      };

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      device: json['device'],
    );
  }
}

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  // 🔵 حفظ
  Future<void> saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> data =
        items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('items', data);
  }

  // 🔵 تحميل
  Future<void> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? data = prefs.getStringList('items');

    if (data != null) {
      setState(() {
        items =
            data.map((e) => Item.fromJson(jsonDecode(e))).toList();
      });
    }
  }

  // ➕ إضافة
  void addItem(String name) {
    setState(() {
      items.add(Item(name: name));
    });
    saveItems();
  }

  // ❌ حذف
  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    saveItems();
  }

  void showAddDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("إضافة غرض"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "اسم الغرض",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  addItem(controller.text);
                }
                Navigator.pop(context);
              },
              child: const Text("إضافة"),
            ),
          ],
        );
      },
    );
  }

  // 🔵 اختيار جهاز
  void showBluetoothDevices(int index) {
    List<String> devices = [
      "Device 1",
      "Device 2",
      "Device 3",
    ];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("اختر جهاز لـ ${items[index].name}"),
          content: SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(devices[i]),
                  onTap: () {
                    setState(() {
                      items[index].device = devices[i];
                    });

                    saveItems();

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "تم ربط ${items[index].name} مع ${devices[i]}",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // 🔔 فحص الاتصال
  void checkItem(int index) {
    if (items[index].device == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("⚠️ ${items[index].name} غير مربوط"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "✅ ${items[index].name} متصل بـ ${items[index].device}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الأغراض"),
      ),
      body: items.isEmpty
          ? const Center(child: Text("لا يوجد أغراض"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(items[index].name),

                    subtitle: Text(
                      items[index].device ?? "غير مربوط",
                      style: TextStyle(
                        color: items[index].device == null
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),

                    leading: const Icon(Icons.devices),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 🔗 ربط
                        IconButton(
                          icon: const Icon(Icons.link),
                          onPressed: () {
                            showBluetoothDevices(index);
                          },
                        ),

                        // 🔔 فحص
                        IconButton(
                          icon: const Icon(Icons.warning, color: Colors.orange),
                          onPressed: () {
                            checkItem(index);
                          },
                        ),

                        // ❌ حذف
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            deleteItem(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
