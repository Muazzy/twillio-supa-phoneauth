import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:phone_auth_twillio/src/base/utils/utils.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:phone_auth_twillio/src/styles/text_theme.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required this.controller,
    this.initialCountryCodeOrPrefix = "PK",
    this.onChanged,
  });

  final TextEditingController controller;
  final String initialCountryCodeOrPrefix;
  final void Function(PhoneNumber)? onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onChanged,
      textAlign: TextAlign.left,
      dropdownIconPosition: IconPosition.leading,
      decoration: InputDecoration(
        counterText: '',
        // contentPadding: const EdgeInsets.only(
        //   left: 12,
        //   right: 12,
        // ),
        contentPadding: EdgeInsets.zero,
        isDense: false,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintText: 'xxxxxxx',
        hintStyle: TextStyling.mediumRegular
            .copyWith(color: AppColors.lightGrey, fontSize: 14.sp),
      ),
      initialCountryCode: initialCountryCodeOrPrefix,
      style: TextStyling.mediumRegular,
      controller: controller,
      textInputAction: TextInputAction.next,
      dropdownTextStyle: TextStyling.mediumRegular,
      textAlignVertical: TextAlignVertical.center,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (phone) {
        print('validator called: ${phone?.number}');
        print('validator called: ${phone?.completeNumber}');

        return ValidationUtils.validateMobile(phone?.number);
      },
    );
  }
}
