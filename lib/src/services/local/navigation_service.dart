import 'package:phone_auth_twillio/src/configs/app_setup.locator.dart';
import 'package:phone_auth_twillio/src/configs/app_setup.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class NavService {
  //for all the navigation things it will be used.
  static final NavigationService _service = locator<NavigationService>();

  //navigator key
  static GlobalKey<NavigatorState>? get key => StackedService.navigatorKey;

  //home screen scaffold key
  static final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> get scaffoldKey => _sKey;

  //onGenerateRoute
  static Route<dynamic>? Function(RouteSettings) get onGenerateRoute =>
      StackedRouter().onGenerateRoute;

  // CLEAR STACK & SHOW
  static Future<dynamic>? login({dynamic arguments}) =>
      _service.clearStackAndShow(Routes.loginView, arguments: arguments);

  static Future<dynamic>? register({dynamic arguments}) =>
      _service.clearStackAndShow(Routes.registerView, arguments: arguments);

  // NAVIGATE TO
  static Future<dynamic>? navigateToRegister({dynamic arguments}) =>
      _service.navigateTo(Routes.registerView, arguments: arguments);

  static Future<dynamic>? navigateToverifyOtp({dynamic arguments}) =>
      _service.navigateTo(
        Routes.verifyOtpView,
        arguments: arguments,
      );

  static Future<dynamic>? home({dynamic arguments}) =>
      _service.clearStackAndShow(Routes.cSDashboardView, arguments: arguments);

  // BACK
  static bool back({dynamic arguments}) => _service.back();
}
