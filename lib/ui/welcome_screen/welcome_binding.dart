import 'package:get/get.dart';

import 'welcome_logic.dart';

class WelcomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeScreenLogic());
  }
}
