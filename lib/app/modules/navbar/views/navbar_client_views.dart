import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/navbar_client_controller.dart';

class NavbarClientView extends StatelessWidget {
  const NavbarClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavbarClientController controller = Get.put(NavbarClientController());

    return Obx(() => Scaffold(
          body: controller.views[controller.selectedIndex.value],
          bottomNavigationBar: Container(
            color: Colors.cyan,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, // Memungkinkan scroll horizontal
              child: GNav(
                backgroundColor: Colors.cyan,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.cyan.shade700,
                gap: 8,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                selectedIndex: controller.selectedIndex.value,
                onTabChange: controller.onItemTapped,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.business,
                    text: 'Kosan',
                  ),
                  GButton(
                    icon: Icons.report,
                    text: 'Komplain',
                  ),
                  GButton(
                    icon: Icons.attach_money,
                    text: 'Keuangan',
                  ),
                  GButton(
                    icon: Icons.account_circle,
                    text: 'Akun',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
