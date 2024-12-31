import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';


class SplashScreenLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  // Future<void> _navigateToNextScreen() async {
  //   await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds
  //   String nextRoute = AppRoutes.getStarted;
  //   Get.offAllNamed(nextRoute); // Navigate to the next screen
  // }

  Future<void> _navigateToNextScreen() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds
      String nextRoute = AppRoutes.home;
      Get.offAllNamed(nextRoute);
    } else {
        await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds
        String nextRoute = AppRoutes.getStarted;
        Get.offAllNamed(nextRoute);
    }
  }
}
