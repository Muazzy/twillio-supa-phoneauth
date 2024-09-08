import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:phone_auth_twillio/src/services/local/connectivity_service.dart';
import 'package:phone_auth_twillio/src/services/remote/supabase_auth_service.dart';
import 'package:phone_auth_twillio/src/views/home/home_view.dart';
import 'package:phone_auth_twillio/src/views/login/login_view.dart';
import 'package:phone_auth_twillio/src/views/register/register_view.dart';
import 'package:phone_auth_twillio/src/views/splash/splash_view.dart';
import 'package:phone_auth_twillio/src/views/verify_otp/verify_otp_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: VerifyOtpView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    // Singletons
    Singleton(classType: ConnectivityService),
    // Lazy singletons
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SupabaseAuthService),
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
