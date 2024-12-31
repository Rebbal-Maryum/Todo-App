import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/generated/assets.dart';
import 'package:todo_app/ui/get_started_screens/get_started_screen_logic.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/constant.dart';
import 'package:todo_app/utils/sizer_utils.dart';
import 'package:todo_app/widgets/common_button.dart';
import 'package:todo_app/widgets/common_text.dart';


class GetStartedScreenPage extends StatelessWidget {
  GetStartedScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorPrimary,
        body: GetBuilder<GetStartedScreenLogic>(
            id: Constant.idPageView,
            builder: (logic) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPaddings.padding_20),
                child: Stack(
                  children: [
                    Container(
                      height: AppSizes.fullHeight / 1.7,
                      width: AppSizes.fullWidth,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(25),
                      child: SmoothPageIndicator(
                        controller: logic.pageController,
                        count: pagesImages.length,
                        effect: ExpandingDotsEffect(
                            activeDotColor: AppColor.colorPrimaryBlue,
                            dotColor: AppColor.gray,
                            dotHeight: 5,
                            dotWidth: 5),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: AppSizes.height_15),
                      child: PageView.builder(
                        onPageChanged: logic.onPageChanged,
                        controller: logic.pageController,
                        itemCount: pagesImages.length,
                        itemBuilder: (_, index) {
                          return pagesImages[index % pagesImages.length];
                        },
                      ),
                    ),
                    Positioned(
                      bottom: AppSizes.height_5_8,
                      left: AppSizes.height_3,
                      right: AppSizes.height_3,
                      child: Column(
                        children: [
                          CommonButton(
                            onTap: logic.onTapNext,
                            text: 'Next'.toUpperCase(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  final pagesImages = List.generate(3, (index) {
    List<String> listImagesUser = [
      Assets.imagesStarted1,
      Assets.imagesStarted2,
      Assets.imagesStarted3,
    ];
    // List<String> listImagesTasker = [
    //   Assets.imagesImgUserOnboard3,
    //   Assets.imagesImgUserOnboard2,
    //   Assets.imagesImgUserOnboard1
    // ];
    List<String> listIntroTextUser = [
      'We Organize your day!'.tr,
      'We help to Plan and tackle your tasks.'.tr,
      'We help you to accomplish all your tasks.'.tr
    ];
    // List<String> listIntroTextTasker = [
    //   'txtTaskerOnBoard1'.tr,
    //   'txtTaskerOnBoard2'.tr,
    //   'txtTaskerOnBoard3'.tr
    // ];
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
           Image.asset(listImagesUser[index],
                    width: index == 2
                        ? AppSizes.fullWidth / 1.1
                        : AppSizes.fullWidth / 1.3,
                    height: AppSizes.fullHeight / 4,
                    fit: BoxFit.contain),
            SizedBox(
              height: AppSizes.fullHeight / 3.9,
            ),
            CommonText(
              text:  listIntroTextUser[index],
              textColor: AppColor.black,
              textAlign: TextAlign.center,
              fontSize: AppFontSize.size_23,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  });
}
