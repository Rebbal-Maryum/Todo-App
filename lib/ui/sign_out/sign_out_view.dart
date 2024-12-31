

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/ui/sign_out/sign_out_logic.dart';
import 'package:todo_app/ui/social_login_screen/social_login_logic.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/constant.dart';
import 'package:todo_app/utils/sizer_utils.dart';
import 'package:todo_app/widgets/common_appbar.dart';
import 'package:todo_app/widgets/common_button.dart';

import 'package:todo_app/widgets/common_text.dart';



class SignOutView extends StatelessWidget {


  const SignOutView({super.key});



  @override
  Widget build(BuildContext context) {
    final User? user=FirebaseAuth.instance.currentUser;
    final String userName=user?.displayName??'User';
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: AppColor.black,
            fontFamily: Constant.fontFamilyNunitoSans,
            fontWeight: FontWeight.w600,
            fontSize: AppFontSize.size_18),),
        leading:     IconButton(onPressed: (){
          String nextRoute = AppRoutes.home;
          Get.offAllNamed(nextRoute);
        }, icon:Icon(Icons.arrow_back_ios_new),
          color: AppColor.black,),
        centerTitle: true,
        backgroundColor:AppColor.colorPrimary,
      ),
      backgroundColor: AppColor.colorPrimary,
      body: GetBuilder<SignOutScreenLogic>(
        builder: (logic) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.padding_20),
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: CommonText(
                  text: 'Sign Out $userName'.tr,
                  textColor: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: AppFontSize.size_16,
                  fontFamily: Constant.fontFamilyNunitoSans,
                ),
                ),
                SizedBox(height: AppSizes.height_2),
                Center(
                  child: CommonButton(
                    onTap: () {
                      Get.find<SignOutScreenLogic>().signOut();
                      String nextRoute = AppRoutes.socialLogin;
                      Get.offAllNamed(nextRoute);
                    },
                    text: 'Sign Out',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




