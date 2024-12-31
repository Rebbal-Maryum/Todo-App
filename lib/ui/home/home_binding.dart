import 'package:get/get.dart';
import 'package:todo_app/ui/home/home_logic.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(
    //   HomeController(),
    //
    // );
    Get.lazyPut(() => HomeController());
  }
}

