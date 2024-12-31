// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:todo_app/ui/splashscreen/splash_binding.dart';
// import 'package:todo_app/ui/splashscreen/splash_view.dart';
// void main(){
//   runApp(    GetMaterialApp(
//     initialBinding: SplashScreenBinding(), // Make sure this is set up correctly
//     initialRoute: '/splash',
//     getPages: [
//       GetPage(
//         name: '/splash',
//         page: () => const SplashViewPage(),
//         binding: SplashScreenBinding(),
//       ),
//       // Add other routes here
//     ],
//   ),);
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashViewPage(),
//     );
//   }
// }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/routes/app_pages.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/constant.dart';





int id = 0;
DateTime? currentBackPressTime;
Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  /// Initialize Internet connectivity manger
  // await InternetConnectivity().instance();
  //
  // /// Initialize Shared Preference
  // ///
  // await Preference().instance();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColor.transparent));

  runApp(const MyApp());
}

// Future<void> _configureLocalTimeZone() async {
//   if (kIsWeb || Platform.isLinux) {
//     return;
//   }
//   tz.initializeTimeZones();
//   final String timeZoneName = await FlutterTimezone.getLocalTimezone();
//   tz.setLocalLocation(tz.getLocation(timeZoneName));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        // bool isUserLoggedIn = Preference.shared.getIsUserLogin();
        //
        // bool isUserGetStarted = Preference.shared.getIsGetStarted();
        // bool isUserIntroduction = Preference.shared.getIsIntroduction();
        // bool isUserSplash = Preference.shared.getIsSplash();
        // bool isUserProfileAdded = Preference.shared.getProfileAdded();
        // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness:
        //   Utils.isLightTheme() ? Brightness.dark : Brightness.light,
        //   statusBarBrightness: Brightness.dark,
        //   systemNavigationBarIconBrightness: Brightness.light,
        // ));
        // SystemChrome.setPreferredOrientations([
        //   DeviceOrientation.portraitUp,
        //   DeviceOrientation.portraitDown,
        // ]);
        return GetMaterialApp(
          theme: ThemeData(
            primaryColor: AppColor.colorPrimary,
            scaffoldBackgroundColor: AppColor.colorPrimary
            // accentColor: Colors.amber,
            // textTheme: TextTheme(
            //   bodyText2: TextStyle(color: Colors.purple),
            // ),
          ),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          // color: AppColor.white,
          // themeMode: Utils.isLightTheme() ? ThemeMode.light : ThemeMode.dark,
          // locale: getLocale(),
          // translations: AppLanguages(),
          fallbackLocale:
          const Locale(Constant.languageEn, Constant.countryCodeEn),
          getPages: AppPages.list,
          // theme: AppTheme.light,
          // darkTheme: AppTheme.dark,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute:
          // isUserSplash
              // ? isUserIntroduction
              // ? isUserGetStarted
              // ? isUserLoggedIn
              // ? isUserProfileAdded
              // ? AppRoutes.home
              // : AppRoutes.addOrEditProfile
              // : AppRoutes.signIn
              // : AppRoutes.getStarted
              // : AppRoutes.welcome
               AppRoutes.splash,
        );
      },
    );
  }
}

