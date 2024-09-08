import 'package:phone_auth_twillio/src/base/enums/verification_mode.dart';
import 'package:phone_auth_twillio/src/base/utils/constants.dart';
import 'package:phone_auth_twillio/src/configs/app_setup.router.dart';
import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_twillio/src/services/remote/base/supabase_auth_view_model.dart';
import 'package:phone_auth_twillio/src/services/remote/supabase_auth_service.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends ReactiveViewModel with SupabaseAuthViewModel {
  init() {}

  final initialCountryCodeOrPrefix = "PK";
  String phone = '';

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  onClickLogin() {
    NavService.login();
  }

  onClickRegister() async {
    if (formKey.currentState!.validate() &&
        phone.isNotEmpty &&
        phoneController.text.length > 4) {
      setBusy(true);
      try {
        final response = await supabaseAuthService.register(phone, email.text);
        setBusy(false);

        if (response) {
          NavService.navigateToverifyOtp(
            arguments: VerifyOtpViewArguments(
              phone: phone,
              mode: VerificationMode.register,
              email: email.text,
              name: name.text,
            ),
          );
        }
      } on AuthExcepection catch (e) {
        Constants.customErrorSnack(e.message);

        setBusy(false);
        return;
      } on CustomNoInternetException catch (e) {
        Constants.customErrorSnack(e.message);
        setBusy(false);
        return;
      } catch (e) {
        setBusy(false);
        Constants.customErrorSnack(e.toString());
        return;
      }
    }
  }
}
