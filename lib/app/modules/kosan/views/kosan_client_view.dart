import 'package:flutter/material.dart';

class KosanClientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamar'),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Tambahkan ini untuk membuat konten bisa digulir
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt),
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'No. HP',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'NIK',
                border: OutlineInputBorder(),
              ),
            ),
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
