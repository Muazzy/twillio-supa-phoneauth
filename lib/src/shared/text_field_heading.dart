import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';

class TextFieldHeading extends StatelessWidget {
  const TextFieldHeading({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 2.w),
      child: Text(
        label,
        style: TextStyling.smallBold.copyWith(
          color: AppColors.grey,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
