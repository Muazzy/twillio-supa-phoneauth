import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:phone_auth_twillio/src/services/remote/base/supabase_auth_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends ReactiveViewModel with SupabaseAuthViewModel {
  init() {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        if (supabaseAuthService.userLoggedIn) {
          NavService.home();
        } else {
          NavService.login();
        }
      },
    );
  }
}
