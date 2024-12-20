import 'package:get/get.dart';
import 'package:kozzzila/app/modules/akun/controllers/akun_client_controller.dart';

import '../controllers/akun_controller.dart';

class AkunClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkunClientController>(
      () => AkunClientController(),
    );
  }
}
