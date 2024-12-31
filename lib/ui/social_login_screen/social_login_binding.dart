import 'package:get/get.dart';
import 'package:todo_app/ui/social_login_screen/social_login_logic.dart';


class SocialLoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SocialLoginScreenLogic());
    Get.put(
      SocialLoginScreenLogic(),
      permanent: true,
    );
  }
}
