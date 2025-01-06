import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../controllers/kosan_client_controller.dart';

class KosanClientView extends StatelessWidget {
  final KosanClientController controller = Get.put(KosanClientController());

  @override
  Widget build(BuildContext context) {
    controller.loadData(); // Muat data saat aplikasi dibuka

    return Scaffold(
      appBar: AppBar(
        title: Text('Kamar'),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: controller.saveData, // Simpan data saat ikon disimpan ditekan
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Obx(() {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: controller.selectedImage.value != null
                          ? FileImage(controller.selectedImage.value!)
                          : null,
                      child: controller.selectedImage.value == null
                          ? Icon(Icons.person, size: 40, color: Colors.grey)
                          : null,
                    ),
                    Positioned(
                      bottom: -4,
                      right: -4,
                      child: IconButton(
                        onPressed: controller.pickImage, // Pilih gambar
                        icon: Icon(Icons.camera_alt),
                        color: Colors.black54,
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 16),
            Obx(() {
              return TextField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: controller.name.value),
                onChanged: (value) => controller.name.value = value,
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return TextField(
                decoration: InputDecoration(
                  labelText: 'No. HP',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: controller.phone.value),
                onChanged: (value) => controller.phone.value = value,
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return TextField(
                decoration: InputDecoration(
                  labelText: 'NIK',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: controller.nik.value),
                onChanged: (value) => controller.nik.value = value,
              );
            }),
            SizedBox(height: 32),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal Masuk',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('01-11-2023'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jenis Kamar',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Reguler 01'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('List Pembayaran',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('Pembayaran Juni'),
                        subtitle: Text('02-06-2024'),
                      ),
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('Pembayaran Juli'),
                        subtitle: Text('02-07-2024'),
                      ),
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('Pembayaran Agustus'),
                        subtitle: Text('02-08-2024'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
