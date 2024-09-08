import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/shared/main_button.dart';
import 'package:phone_auth_twillio/src/shared/spacing.dart';
import 'package:phone_auth_twillio/src/styles/text_theme.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget? child) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 16.h,
        ),
        child: Column(
          children: [
            VerticalSpacing(20.h),
            Center(
              child: Text(
                'Home Screen',
                style: TextStyling.largeRegular,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name: ',
                        style: TextStyling.mediumRegular,
                      ),
                      Text(
                        model.supabaseAuthService.user?.name ?? '',
                        style: TextStyling.mediumBold,
                      ),
                    ],
                  ),
                  VerticalSpacing(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Phone: ',
                        style: TextStyling.mediumRegular,
                      ),
                      Text(
                        model.supabaseAuthService.user?.phone ?? '',
                        style: TextStyling.mediumBold,
                      ),
                    ],
                  ),
                  VerticalSpacing(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Email: ',
                        style: TextStyling.mediumRegular,
                      ),
                      Text(
                        model.supabaseAuthService.user?.email ?? '',
                        style: TextStyling.mediumBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            MainButton(
              buttonText: 'Logout',
              onPressed: model.onClickLogout,
              isLoading: model.isBusy,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel model) => model.init();
}
