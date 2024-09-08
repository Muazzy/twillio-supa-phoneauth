import 'package:flutter/material.dart';
import 'package:phone_auth_twillio/src/shared/loading_indicator.dart';
import 'package:stacked/stacked.dart';

import 'splash_view_model.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({super.key});

  @override
  Widget builder(BuildContext context, SplashViewModel model, Widget? child) {
    return const Scaffold(
      body: Center(
        child: LoadingIndicator(),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel model) => model.init();
}
