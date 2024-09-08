import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/base/enums/verification_mode.dart';
import 'package:phone_auth_twillio/src/shared/custom_app_bar.dart';

import 'package:phone_auth_twillio/src/shared/main_button.dart';
import 'package:phone_auth_twillio/src/shared/spacing.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';

import 'verify_otp_view_model.dart';

class VerifyOtpView extends StackedView<VerifyOtpViewModel> {
  const VerifyOtpView({
    super.key,
    required this.phone,
    required this.mode,
    required this.email,
    required this.name,
  });

  final String phone;
  final VerificationMode mode;
  final String? email;
  final String? name;

  @override
  Widget builder(
      BuildContext context, VerifyOtpViewModel model, Widget? child) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            titleText: 'Verify OTP',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(40.h),
                  Text(
                    'Verify your account',
                    style: TextStyling.mediumBold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  VerticalSpacing(10.h),
                  Text(
                    'We have sent a verification code to your phone number $phone, please enter code here',
                    style: TextStyling.smallRegular.copyWith(),
                  ),
                  VerticalSpacing(40.h),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: PinCodeTextField(
                        backgroundColor: AppColors.white,
                        cursorColor: AppColors.primary,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10.r),
                          fieldHeight: 55.h,
                          fieldWidth: 50.w,
                          activeColor: AppColors.primary,
                          activeFillColor: AppColors.primary,
                          selectedColor: AppColors.primary,
                          inactiveColor: AppColors.lightGrey,
                          inactiveFillColor: AppColors.black,
                        ),
                        textStyle: TextStyling.mediumBold.copyWith(
                          color: AppColors.black,
                        ),
                        appContext: context,
                        length: 6,
                        onChanged: (value) {},
                        controller: model.otpController,
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                  ),
                  Spacer(),
                  MainButton(
                    onPressed: model.onClickVerifyOTP,
                    isLoading: model.isBusy,
                    buttonText: 'Verify',
                  ),
                  VerticalSpacing(40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  VerifyOtpViewModel viewModelBuilder(BuildContext context) =>
      VerifyOtpViewModel(
        mode: mode,
        phone: phone,
        email: email,
        name: name,
      );

  @override
  void onViewModelReady(VerifyOtpViewModel model) => model.init();
}
