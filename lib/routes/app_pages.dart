import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_app/ui/get_started_screens/get_started_screen_binding.dart';
import 'package:todo_app/ui/get_started_screens/get_started_screen_view.dart';
import 'package:todo_app/ui/home/home_binding.dart';
import 'package:todo_app/ui/home/home_logic.dart';

import 'package:todo_app/ui/home/view/home_screens.dart';
import 'package:todo_app/ui/sign_out/sign_out_binding.dart';
import 'package:todo_app/ui/sign_out/sign_out_logic.dart';
import 'package:todo_app/ui/sign_out/sign_out_view.dart';
import 'package:todo_app/ui/social_login_screen/social_login_binding.dart';
import 'package:todo_app/ui/social_login_screen/social_login_view.dart';

import 'package:todo_app/ui/splashscreen/splash_binding.dart';
import 'package:todo_app/ui/splashscreen/splash_view.dart';
import 'package:todo_app/ui/welcome_screen/welcome_binding.dart';
import 'package:todo_app/ui/welcome_screen/welcome_view.dart';


import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashViewPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () =>HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.signIn,
    //   page: () => SignInScreen(),
    //   binding: SignInBinding(),
    // ),
    GetPage(
      name: AppRoutes.signOut,
      page: () => const SignOutView(),
      binding: SignOutScreenBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: () => const SplashViewPage(),
    //   binding: SplashScreenBinding(),
    // ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreenPage(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.getStarted,
      page: () => GetStartedScreenPage(),
      binding: GetStartedScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.socialLogin,
      page: () => SocialLoginScreenView(),
      binding: SocialLoginScreenBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => const ForgotPasswordScreenPage(),
    //   binding: ForgotPasswordScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.addOrEditProfile,
    //   page: () => const AddOrEditProfileScreenPage(),
    //   binding: AddOrEditProfileScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.setting,
    //   page: () => const SettingScreenPage(),
    //   binding: SettingScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.changeLanguage,
    //   page: () => ChangeLanguageScreen(),
    //   binding: ChangeLanguageBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.chooseLocation,
    //   page: () =>const  ChooseLocationViewPage(),
    //   binding: ChooseLocationBinding(),
    // ),
  ];
}
