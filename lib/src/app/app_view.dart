import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_auth_twillio/src/base/utils/constants.dart';
import 'package:phone_auth_twillio/src/styles/app_colors.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarColor: AppColors.primary.withOpacity(0.7),

        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, snapshot) {
        return MaterialApp(
          title: Constants.appTitle,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NavService.onGenerateRoute,
          navigatorKey: NavService.key,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              secondary: AppColors.secondary,
              onSecondary: AppColors.white,
              error: AppColors.red,
              onError: AppColors.white,
              background: AppColors.white,
              onBackground: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.primary,
            ),
            fontFamily: 'Poppins',
          ),
          builder: (context, child) {
            return Stack(
              children: [child!],
            );
          },
        );
      },
    );
  }
}
