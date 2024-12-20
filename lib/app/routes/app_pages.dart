// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:kozzzila/app/modules/home/bindings/home_client_binding.dart';
import 'package:kozzzila/app/modules/komplain/bindings/komplain_binding.dart';
import 'package:kozzzila/app/modules/komplain/views/komplain_view.dart';
import 'package:kozzzila/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:kozzzila/app/modules/navbar/views/navbar_client_views.dart';
import 'package:kozzzila/app/modules/navbar/views/navbar_view.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keuangan/bindings/keuangan_binding.dart';
import '../modules/keuangan/views/keuangan_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes
      .HOME_CLIENT; //ganti dengan Routes.HOME jika ingin menggunakan home biasa

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => NavbarView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.KEUANGAN,
      page: () => KeuanganView(),
      binding: KeuanganBinding(),
    ),
    GetPage(
      name: _Paths.KOMPLAIN,
      page: () => KomplainView(),
      binding: KomplainBinding(),
    ),
    GetPage(
      name: _Paths.HOME_CLIENT,
      page: () => NavbarClientView(),
      binding: HomeClientBinding(),
    ),
    //   GetPage(
    //   name: _Paths.KOSAN_CLIENT,
    //   // page: () => ClientView(),
    //   // binding: HomeClientBinding(),
    // ),
  ];
}
