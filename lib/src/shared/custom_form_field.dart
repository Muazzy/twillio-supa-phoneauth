import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';

import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    required this.validatorFunction,
    this.controller,
    // required this.textColor,
    this.textFieldBgColor,
    this.isLabelCenter = false,
    this.readOnly = false,
    this.showLabel = false,
    this.borderRadius,
    this.textInputType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.suffixWidget,
    this.prefixWidget,
    this.maxLength,
    this.textInputFormatters,
    this.togglePasswordVisibility,
    this.isFilled = false,
    this.obscureText = false,
    this.onChanged,
  });

  final String labelText;
  final bool isPassword;
  final bool obscureText;
  final String? Function(String?) validatorFunction;
  final TextEditingController? controller;
  // final Color textColor;
  final Color? textFieldBgColor;
  final bool isLabelCenter;
  final bool readOnly;
  final bool showLabel;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatters;
  final BorderRadius? borderRadius;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool isFilled;
  final VoidCallback? togglePasswordVisibility;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      validator: validatorFunction,
      style: TextStyling.mediumRegular,
      cursorColor: AppColors.primary.withOpacity(0.5),
      maxLength: maxLength,
      inputFormatters: textInputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: prefixWidget != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: prefixWidget,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        filled: isFilled,
        fillColor: textFieldBgColor ?? AppColors.primary.withOpacity(0.5),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: togglePasswordVisibility,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ),
              )
            : suffixWidget,
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.black.withOpacity(0.5),
            ),
        floatingLabelBehavior: !showLabel ? FloatingLabelBehavior.never : null,
        label: isLabelCenter
            ? Center(
                child: Text(
                  labelText,
                  style: TextStyling.smallRegular.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.grey,
                  ),
                ),
              )
            : Text(
                labelText,
                style: TextStyling.smallRegular.copyWith(
                  fontSize: 13.sp,
                  color: AppColors.grey,
                ),
              ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
      ),
    );
  }
}
