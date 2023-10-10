import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinging extends Bindings {
  @override
  void dependencies() {
    // print('HomeBinging');
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
