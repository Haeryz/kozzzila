import 'package:flutter/material.dart';

class KomplainClientView extends StatefulWidget {
  @override
  _KomplainViewState createState() => _KomplainViewState();
}

class _KomplainViewState extends State<KomplainClientView> {
  final List<Map<String, dynamic>> komplainData = [
    {
      "name": "Riyo",
      "date": "12 Sep 2024",
      "description": "Ada Kunci Motor Ketinggalan di Parkiran",
      "status": "Tunda"
    },
    {
      "name": "Hanif",
      "date": "10 Sep 2024",
      "description": "Sinyal wifi buruk",
      "status": "Proses"
    },
    {
      "name": "Mamat",
      "date": "7 Sep 2024",
      "description": "Kasur saya rusak mas",
      "feedback": "Sudah saya perbaiki mas tadi jam 9 pagi tks",
      "status": "Selesai"
    },
  ];

  Map<String, dynamic>? selectedKomplain;
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komplain'),
        backgroundColor: Colors.cyan,
        leading: selectedKomplain != null
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    selectedKomplain = null;
                  });
                },
              )
            : null,
      ),
      body: selectedKomplain == null
          ? _buildKomplainList()
          : _buildKomplainDetail(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika tambah data baru di sini
          showDialog(
            context: context,
            builder: (context) {
              return _buildAddKomplainDialog();
            },
          );
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildKomplainList() {
    return ListView.builder(
      itemCount: komplainData.length,
      itemBuilder: (context, index) {
        final item = komplainData[index];
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(item['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tanggal: ${item['date']}'),
                Text('Deskripsi: ${item['description']}'),
                Text('Feedback: ${item['feedback'] ?? "-"}'),
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _getStatusColor(item['status']),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                item['status'],
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              setState(() {
                selectedKomplain = item;
                feedbackController.text = item['feedback'] ?? '';
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildKomplainDetail() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama: ${selectedKomplain!['name']}'),
          Text('Tanggal: ${selectedKomplain!['date']}'),
          Text('Deskripsi: ${selectedKomplain!['description']}'),
          SizedBox(height: 16),
          Text(
            'Status:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getStatusColor(selectedKomplain!['status']),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              selectedKomplain!['status'],
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: feedbackController,
            decoration: InputDecoration(
              hintText: 'Tambahkan teks',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedKomplain = null;
                  });
                },
                child: Text('Batal'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedKomplain!['feedback'] = feedbackController.text;
                    selectedKomplain = null;
                  });
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddKomplainDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return AlertDialog(
      title: Text("Tambah Komplain"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Nama"),
          ),
          SizedBox(height: 8),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: "Deskripsi"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              komplainData.add({
                "name": nameController.text,
                "date": DateTime.now().toString().split(' ')[0],
                "description": descriptionController.text,
                "status": "Tunda"
              });
            });
            Navigator.pop(context);
          },
          child: Text("Simpan"),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Tunda':
        return Colors.grey;
      case 'Proses':
        return Colors.blue;
      case 'Selesai':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
