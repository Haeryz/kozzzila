import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozzzila/app/modules/akun/views/akun_client_view.dart';
import 'package:kozzzila/app/modules/keuangan/views/keuangan_client_view.dart';
import 'package:kozzzila/app/modules/komplain/views/komplai_client_view.dart';
import 'package:kozzzila/app/modules/kosan/views/kosan_client_view.dart';

import '../../home/views/home_client_view.dart';
// import '../../kosan/views/kosan_client_view.dart';
// import '../../komplain/views/komplain_client_view.dart';
// import '../../keuangan/views/keuangan_client_view.dart';
// import '../../akun/views/akun_client_view.dart';

class NavbarClientController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> views = [
    HomeClientView(),
    KosanClientView(),
    KomplainClientView(),
    KeuanganClientView(),
    AkunClientView(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
