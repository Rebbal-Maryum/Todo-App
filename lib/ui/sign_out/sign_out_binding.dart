import 'package:get/get.dart';
import 'package:todo_app/ui/sign_out/sign_out_logic.dart';



class SignOutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignOutScreenLogic());
  }
}
