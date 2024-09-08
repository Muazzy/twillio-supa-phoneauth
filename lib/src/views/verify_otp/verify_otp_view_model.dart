import 'package:flutter/material.dart';
import 'package:phone_auth_twillio/src/base/utils/constants.dart';
import 'package:phone_auth_twillio/src/services/remote/supabase_auth_service.dart';
import 'package:stacked/stacked.dart';

import 'package:phone_auth_twillio/src/base/enums/verification_mode.dart';
import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:phone_auth_twillio/src/services/remote/base/supabase_auth_view_model.dart';

class VerifyOtpViewModel extends ReactiveViewModel with SupabaseAuthViewModel {
  final VerificationMode mode;
  final String phone;
  final String? email;
  final String? name;

  VerifyOtpViewModel({
    required this.mode,
    required this.phone,
    required this.email,
    required this.name,
  });

  final otpController = TextEditingController();
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  init() {}

  onClickVerifyOTP() async {
    if (otpController.text.length >= 6) {
      if (mode == VerificationMode.login) {
        onLoginVerify();
      } else if (mode == VerificationMode.register) {
        onRegisterVerify();
      }
    }
  }

  onRegisterVerify() async {
    setBusy(true);
    try {
      final response = await supabaseAuthService.verifyPhoneNumberAndRegister(
        email: email ?? '',
        name: name ?? '',
        phone: phone,
        otp: otpController.text,
      );

      if (response == null) {
        Constants.customWarningSnack('Error registering the user');
        setBusy(false);
        return;
      }
      setBusy(false);
      Constants.customSuccessSnack('Welcome ${response.name}');
      _navigateToDashboard();
    } on CustomNoInternetException catch (e) {
      Constants.customErrorSnack(e.message);
      setBusy(false);
    } on AuthExcepection catch (e) {
      Constants.customErrorSnack(e.message);
      setBusy(false);
    } catch (e) {
      Constants.customErrorSnack(e.toString());
      setBusy(false);
    }
  }

  onLoginVerify() async {
    setBusy(true);
    try {
      final response = await supabaseAuthService.verifyPhoneNumberAndLogin(
        phone: phone,
        otp: otpController.text,
      );

      if (response == null) {
        Constants.customWarningSnack('Error logging in the user');
        setBusy(false);
        return;
      }
      setBusy(false);
      Constants.customSuccessSnack('Welcome ${response.name}');
      _navigateToDashboard();
    } on CustomNoInternetException catch (e) {
      setBusy(false);
      Constants.customErrorSnack(e.message);
    } on AuthExcepection catch (e) {
      setBusy(false);
      Constants.customErrorSnack(e.message);
    } catch (e) {
      setBusy(false);
      Constants.customErrorSnack(e.toString());
    }
  }

  void _navigateToDashboard() {
    NavService.home();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }
}
