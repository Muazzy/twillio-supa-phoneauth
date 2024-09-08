import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.titleText,
    this.showBackButton = true,
    this.trailingWidget,
    this.titleTextStyle,
    this.backButtonColor,
    this.backButtonIcon,
  }) : super(key: key);

  final bool showBackButton;

  final Widget? title;
  final String? titleText;
  final Widget? trailingWidget;
  final TextStyle? titleTextStyle;
  final Color? backButtonColor;
  final IconData? backButtonIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 24.w, right: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackButton)
            IconButton(
              onPressed: () {
                NavService.back();
              },
              iconSize: 20.sp,
              icon: Icon(
                backButtonIcon ?? Icons.arrow_back_ios,
                color: backButtonColor ?? AppColors.black,
              ),
            ),
          if (!showBackButton)
            Visibility(
              visible: false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: IconButton(
                onPressed: () {
                  NavService.back();
                },
                iconSize: 20.sp,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: backButtonColor ?? AppColors.black,
                ),
              ),
            ),
          const Spacer(),
          title ??
              Text(
                titleText ?? '',
                style: titleTextStyle ??
                    TextStyling.mediumBold.copyWith(fontSize: 20.sp),
              ),
          const Spacer(),
          Row(
            children: [
              if (trailingWidget != null)
                trailingWidget!
              else
                Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
