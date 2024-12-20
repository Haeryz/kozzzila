import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozzzila/app/modules/authentication/controllers/authentication_controller.dart';

class AkunClientView extends StatelessWidget {
  final AuthenticationController _authController =
      Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akun"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Ganti dengan gambar profil
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "M. Gohar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Reguler 01"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.cyan),
              title: const Text("Profile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileView()),
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.account_balance_wallet, color: Colors.cyan),
              title: const Text("Info Bank"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoBankView()),
                );
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Keluar",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                _authController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBankView extends StatefulWidget {
  @override
  _InfoBankViewState createState() => _InfoBankViewState();
}

class _InfoBankViewState extends State<InfoBankView> {
  List<Map<String, String>> bankInfo = [
    {"bank": "BCA", "noRekening": "123773", "pemilik": "Aura Ngawi"}
  ];

  void editBankInfo(int index) {
    final bankController = TextEditingController(text: bankInfo[index]["bank"]);
    final noRekeningController =
        TextEditingController(text: bankInfo[index]["noRekening"]);
    final pemilikController =
        TextEditingController(text: bankInfo[index]["pemilik"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Info Bank"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bankController,
                decoration: const InputDecoration(labelText: "Nama Bank"),
              ),
              TextField(
                controller: noRekeningController,
                decoration: const InputDecoration(labelText: "No Rekening"),
              ),
              TextField(
                controller: pemilikController,
                decoration:
                    const InputDecoration(labelText: "Nama Pemilik Rekening"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bankInfo[index] = {
                    "bank": bankController.text,
                    "noRekening": noRekeningController.text,
                    "pemilik": pemilikController.text,
                  };
                });
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void deleteBankInfo(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Info Bank"),
          content: Text(
              "Apakah Anda yakin ingin menghapus info bank ${bankInfo[index]["bank"]}?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bankInfo.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Bank"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: bankInfo.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${bankInfo[index]["bank"]}"),
              subtitle: Text(
                  "No. Rek: ${bankInfo[index]["noRekening"]}\nan ${bankInfo[index]["pemilik"]}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => editBankInfo(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteBankInfo(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
        onPressed: () {
          // Tambahkan logika untuk tambah info bank baru
        },
      ),
    );
  }
}

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  // Tambahkan logika untuk upload foto profil
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: "Nama Kosan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk simpan profil
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
              ),
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
