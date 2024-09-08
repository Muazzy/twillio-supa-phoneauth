import 'package:phone_auth_twillio/src/shared/custom_phone_number_field.dart';
import 'package:phone_auth_twillio/src/shared/main_button.dart';
import 'package:phone_auth_twillio/src/shared/spacing.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:phone_auth_twillio/generated/assets.dart';
import 'package:phone_auth_twillio/src/base/utils/utils.dart';

import 'login_view_model.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(BuildContext context, LoginViewModel model, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: context.screenSize().width,
        height: context.screenSize().height,
        child: Form(
          key: model.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalSpacing(100.h),
                CustomPhoneNumberField(
                  controller: model.phoneController,
                  initialCountryCodeOrPrefix: model.initialCountryCodeOrPrefix,
                  onChanged: (phonenumber) {
                    // model.initialCountryCodeOrPrefix = phonenumber.;
                    model.phone = phonenumber.completeNumber;
                    print(model.phone);
                  },
                ),
                VerticalSpacing(40.h),
                MainButton(
                  buttonText: 'Login',
                  onPressed: model.onClickLogin,
                  isLoading: model.isBusy,
                  buttonFontColor: AppColors.white,
                ),
                // VerticalSpacing(80.h),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyling.mediumRegular,
                    ),
                    TextButton(
                      onPressed: model.onClickRegister,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Register",
                        style: TextStyling.mediumBold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel model) => model.init();
}
