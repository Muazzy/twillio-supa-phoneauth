import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:phone_auth_twillio/src/configs/supabase_setup.dart';
import 'package:phone_auth_twillio/src/services/remote/supabase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phone_auth_twillio/src/app/app_view.dart';
import 'package:phone_auth_twillio/src/configs/app_setup.locator.dart';
import 'package:phone_auth_twillio/src/services/local/flavor_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //LOAD ENV
  await dotenv.load(fileName: ".env");

  //initialize supabase
  await SupabaseSetup.init();
  SupabaseAuthService.prefs = await SharedPreferences.getInstance();

  // getting package
  final package = await PackageInfo.fromPlatform();

  setupLocator();

  // app flavor init
  FlavorService.init(package);

  runApp(const AppView());
}
