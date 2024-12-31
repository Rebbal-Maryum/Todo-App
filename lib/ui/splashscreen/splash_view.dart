import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../generated/assets.dart';
import 'splash_logic.dart';

class SplashViewPage extends StatelessWidget {
  const SplashViewPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Get.theme.colorScheme.onBackground,
        extendBodyBehindAppBar: true,
        body: GetBuilder<SplashScreenLogic>(builder: (logic) {
          return Center(
            child: Image.asset(
              Assets.imagesTodoIcon,
              // width: double.infinity,
              // height: double.infinity,
              fit: BoxFit.fill,
            ),
          );
        }));
  }
}
