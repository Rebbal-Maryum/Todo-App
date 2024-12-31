import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/utils/color.dart';

class SocialLoginScreenLogic extends GetxController {
  // @override
  // void onReady() {
  //   super.onReady();
  //   _navigateToNextScreen();
  // }
  // @override
  // void onInit() {
  //   super.onInit();
  //   _navigateToNextScreen();
  // }


  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
signInWithGoogle() async{

  final GoogleSignIn _googleSignIn=GoogleSignIn();
try{
  final GoogleSignInAccount? googleSignInAccount=await _googleSignIn.signIn();
  if(googleSignInAccount!=null){
    final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    final AuthCredential credential=GoogleAuthProvider.credential(
      idToken:googleSignInAuthentication.idToken,
      accessToken:googleSignInAuthentication.accessToken,
    );
    await firebaseAuth.signInWithCredential(credential);
    String nextRoute = AppRoutes.home;
    Get.offAllNamed(nextRoute);
   }
}
catch(e)
  {
  print('Error is $e');
  }
}
  // Future<void> _navigateToNextScreen() async {
  //   // Get the current user
  //   User? user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null) {
  //     await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds
  //     String nextRoute = AppRoutes.home;
  //     Get.offAllNamed(nextRoute);
  //   } else {
  //     Get.snackbar(
  //       "Not Signed In",  // Title
  //       "You have not signed up. Kindly sign up.",  // Message
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: AppColor.colorRed,
  //       colorText: AppColor.black,
  //     );
  //   }
  // }
}
