import 'package:get/get.dart';
import 'package:kozzzila/app/modules/komplain/controllers/komplain_client_controller.dart';

import '../controllers/komplain_controller.dart';

class KomplainClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KomplainClientController>(
      () => KomplainClientController(),
    );
  }
}
