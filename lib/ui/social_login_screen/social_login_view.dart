import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/generated/assets.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/ui/social_login_screen/social_login_logic.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/constant.dart';
import 'package:todo_app/utils/sizer_utils.dart';
import 'package:todo_app/widgets/common_button.dart';
import 'package:todo_app/widgets/common_text.dart';



class SocialLoginScreenView extends StatelessWidget {


 const SocialLoginScreenView({super.key});
 // FirebaseAuth.instance.setLanguageCode('en');


  @override
  Widget build(BuildContext context) {
    SocialLoginScreenLogic logic=SocialLoginScreenLogic();
    return Scaffold(
      backgroundColor: AppColor.colorPrimary,
      body: GetBuilder<SocialLoginScreenLogic>(
        builder: (logic) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppPaddings.padding_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSizes.height_15),
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesWelcomeimg,
                      height: AppSizes.height_20,
                    ),
                    CommonText(
                      text: 'Welcome'.tr,
                      textColor:AppColor.colorPrimaryBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontSize.size_40,
                      fontFamily: Constant.fontFamilyNunitoSans,
                      fontStyle: FontStyle.italic,
                    ),
                  ],
                ),

                SizedBox(height: AppSizes.height_9_5),
                Center(
                  child: CommonText(
                    text: 'Let\'s get started'.tr,
                    textColor: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: AppFontSize.size_35,
                    fontFamily: Constant.fontFamilyNunitoSans,
                  ),
                ),
                SizedBox(height: AppSizes.height_2_8),
                const SocialLogin(),

              ],
            ),
          );
        },
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {

  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLoginScreenLogic>(builder: (logic) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Google Login
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.gray,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: InkWell(
              onTap: () => logic.signInWithGoogle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesGoogle,
                    height: AppSizes.height_5,
                  ),
                  SizedBox(width: AppSizes.width_0_2),
                  CommonText(
                    text: 'Continue with Google'.tr,
                    textColor: AppColor.black,
                    fontWeight: FontWeight.normal,
                    fontSize: AppFontSize.size_14,
                    fontFamily: Constant.fontFamilyNunitoSans,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    );
  }
}


