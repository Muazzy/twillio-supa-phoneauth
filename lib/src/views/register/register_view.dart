import 'package:phone_auth_twillio/src/shared/custom_app_bar.dart';
import 'package:phone_auth_twillio/src/shared/custom_form_field.dart';
import 'package:phone_auth_twillio/src/shared/custom_phone_number_field.dart';
import 'package:phone_auth_twillio/src/shared/main_button.dart';
import 'package:phone_auth_twillio/src/shared/spacing.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:phone_auth_twillio/src/base/utils/utils.dart';

import 'register_view_model.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(BuildContext context, RegisterViewModel model, Widget? child) {
    return Scaffold(
      body: SizedBox(
        width: context.screenSize().width,
        height: context.screenSize().height,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 10.h,
          ),
          child: Form(
            key: model.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomAppBar(
                  titleText: 'Create an account',
                  showBackButton: false,
                ),

                VerticalSpacing(40.h),
                CustomFormField(
                  labelText: 'Name',
                  validatorFunction: (c) {
                    return ValidationUtils.validateName(c);
                  },
                  prefixWidget: const Icon(Icons.person),
                  controller: model.name,
                ),
                VerticalSpacing(25.h),
                // CustomFormField(
                //   labelText: 'Phone',
                //   validatorFunction: (c) {
                //     return ValidationUtils.validateMobile(c);
                //   },
                //   showLabel: false,
                //   prefixWidget: const Icon(Icons.phone),
                //   controller: model.phone,
                // ),
                CustomPhoneNumberField(
                  controller: model.phoneController,
                  initialCountryCodeOrPrefix: model.initialCountryCodeOrPrefix,
                  onChanged: (phonenumber) {
                    // model.initialCountryCodeOrPrefix = phonenumber.;
                    model.phone = phonenumber.completeNumber;
                    print(model.phone);
                  },
                ),

                VerticalSpacing(25.h),
                CustomFormField(
                  labelText: 'Email',
                  validatorFunction: (c) {
                    return ValidationUtils.validateEmail(c);
                  },
                  prefixWidget: const Icon(Icons.email),
                  controller: model.email,
                ),
                VerticalSpacing(80.h),
                MainButton(
                  buttonText: 'Register',
                  onPressed: model.onClickRegister,
                  isLoading: model.isBusy,
                  buttonFontColor: AppColors.white,
                ),
                VerticalSpacing(80.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyling.mediumRegular,
                    ),
                    TextButton(
                      onPressed: model.onClickLogin,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        // minimumSize: Size.zero,
                      ),
                      child: Text(
                        "Login",
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
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();

  @override
  void onViewModelReady(RegisterViewModel model) => model.init();
}
