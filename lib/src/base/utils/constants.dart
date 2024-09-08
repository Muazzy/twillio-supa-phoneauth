import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phone_auth_twillio/generated/assets.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';

class Constants {
  Constants._();

  static String get appTitle => "Example";

  static customErrorSnack(String? msg, {String? title}) {
    Get.snackbar(
      title ?? "Error",
      msg ?? "Error",
      titleText: Text(
        title ?? "Error",
        style: TextStyling.large2Bold.copyWith(
          color: AppColors.error,
          fontSize: 15.sp,
        ),
      ),
      messageText: Text(
        msg.toString(),
        style: TextStyling.mediumRegular.copyWith(
          color: AppColors.white,
          fontSize: 12.sp,
        ),
      ),
      backgroundColor: AppColors.primary.withOpacity(0.8),
      duration: Duration(seconds: 3),
      icon: Image.asset(
        Assets.errorIcon,
        height: 20.h,
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    );
  }

  static customSuccessSnack(String? msg, {String? title}) {
    Get.snackbar(
      title ?? "Congrats",
      msg ?? "Congrats",
      titleText: Text(
        title ?? "Congrats",
        style: TextStyling.large2Bold.copyWith(
          color: AppColors.green,
          fontSize: 15.sp,
        ),
      ),
      messageText: Text(
        msg.toString(),
        style: TextStyling.mediumRegular.copyWith(
          color: AppColors.white,
          fontSize: 12.sp,
        ),
      ),
      backgroundColor: AppColors.primary,
      duration: Duration(seconds: 3),
      icon: Image.asset(
        Assets.successIcon,
        height: 20.h,
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    );
  }

  static customWarningSnack(String? msg, {String? title}) {
    Get.snackbar(
      title ?? "Warning",
      msg ?? "Warning",
      titleText: Text(
        title ?? "Warning",
        style: TextStyling.large2Bold.copyWith(
          color: AppColors.white,
          // color: AppColors.warning,
          fontSize: 15.sp,
        ),
      ),
      messageText: Text(
        msg.toString(),
        style: TextStyling.mediumRegular.copyWith(
          color: AppColors.white,
          fontSize: 12.sp,
        ),
      ),
      backgroundColor: AppColors.primary,
      duration: Duration(seconds: 3),
      icon: Image.asset(
        Assets.warningIcon,
        height: 20.h,
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
    );
  }
}
