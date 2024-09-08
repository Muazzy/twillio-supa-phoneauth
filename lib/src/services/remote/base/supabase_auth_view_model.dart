import 'package:stacked/stacked.dart';
import 'package:phone_auth_twillio/src/configs/app_setup.locator.dart';
import 'package:phone_auth_twillio/src/services/remote/supabase_auth_service.dart';

mixin SupabaseAuthViewModel on ReactiveViewModel {
  final SupabaseAuthService _authService = locator<SupabaseAuthService>();

  SupabaseAuthService get supabaseAuthService => _authService;

  @override
  List<ListenableServiceMixin> get listenableServices =>
      super.listenableServices + [_authService];
}
