import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final Color buttonFontColor;
  final VoidCallback onPressed;
  final bool fullWidth;
  final bool isLoading;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final Color? buttonColor;
  const MainButton({
    Key? key,
    required this.buttonText,
    this.buttonFontColor = Colors.black,
    required this.onPressed,
    this.fullWidth = true,
    required this.isLoading,
    this.height,
    this.width,
    this.padding,
    this.fontSize,
    this.borderRadius,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: fullWidth ? double.infinity : width,
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.primary,
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            ),
          ),
          padding: MaterialStatePropertyAll(
            padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          ),
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: Transform.scale(
                  scale: 0.6,
                  child: CircularProgressIndicator(
                    color: buttonFontColor,
                  ),
                ),
              )
            : Text(
                buttonText,
                style: TextStyling.mediumBold.copyWith(
                  fontSize: fontSize ?? 16.sp,
                  color: buttonFontColor,
                ),
              ),
      ),
    );
  }
}
