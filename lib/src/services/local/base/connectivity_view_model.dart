import 'package:phone_auth_twillio/src/configs/app_setup.locator.dart';
import 'package:phone_auth_twillio/src/services/local/connectivity_service.dart';
import 'package:stacked/stacked.dart';

mixin ConnectivityViewModel on ReactiveViewModel {
  final ConnectivityService _connectivityService =
      locator<ConnectivityService>();
  ConnectivityService get connectivityService => _connectivityService;

  @override
  List<ListenableServiceMixin> get listenableServices => [_connectivityService];
}
