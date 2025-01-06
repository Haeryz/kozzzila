import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KosanClientController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null); // Gambar yang dipilih
  RxString name = ''.obs; // Nama pengguna
  RxString phone = ''.obs; // Nomor HP
  RxString nik = ''.obs; // NIK

  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      await saveImagePath(pickedFile.path); // Simpan path gambar
    }
  }

  // Simpan data ke SharedPreferences
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.value);
    await prefs.setString('phone', phone.value);
    await prefs.setString('nik', nik.value);
  }

  // Muat data dari SharedPreferences
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    phone.value = prefs.getString('phone') ?? '';
    nik.value = prefs.getString('nik') ?? '';
    String? imagePath = prefs.getString('imagePath');
    if (imagePath != null && File(imagePath).existsSync()) {
      selectedImage.value = File(imagePath);
    }
  }

  // Simpan path gambar ke SharedPreferences
  Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', path);
  }
}
