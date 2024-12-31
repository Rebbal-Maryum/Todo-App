import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/color.dart';
import 'package:todo_app/utils/sizer_utils.dart';
import 'package:todo_app/widgets/common_text.dart';


class CommonButton extends StatelessWidget {
  final void Function() onTap;

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final double? fontSize;
  const CommonButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.backgroundColor,
      this.foregroundColor,
      this.shadowColor,
        this.fontSize,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.fullWidth - 50,
      height: AppSizes.height_5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: (shadowColor ?? Get.theme.colorScheme.primary)
                  .withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
          style: ElevatedButton.styleFrom(
            //shadowColor: Get.theme.colorScheme.primary,
            elevation: 0,
            backgroundColor: backgroundColor ?? AppColor.colorPrimaryBlue,
            foregroundColor:
                foregroundColor ?? Get.theme.colorScheme.background,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            splashFactory: InkSplash.splashFactory,
          ),
          child: CommonText(
            text: text,
            textColor: AppColor.black,
            textAlign: TextAlign.center,
            fontSize: fontSize ?? AppFontSize.size_12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
