import 'package:flutter/material.dart';
import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:phone_auth_twillio/src/services/remote/base/supabase_auth_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel with SupabaseAuthViewModel {
  init() {}

  onClickLogout() async {
    await supabaseAuthService.logout();
    NavService.login();
  }
}
