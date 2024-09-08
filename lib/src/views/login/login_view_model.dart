import 'package:phone_auth_twillio/src/base/enums/verification_mode.dart';
import 'package:phone_auth_twillio/src/base/utils/constants.dart';
import 'package:phone_auth_twillio/src/configs/app_setup.router.dart';
import 'package:phone_auth_twillio/src/services/local/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_twillio/src/services/remote/base/supabase_auth_view_model.dart';
import 'package:phone_auth_twillio/src/services/remote/supabase_auth_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends ReactiveViewModel with SupabaseAuthViewModel {
  init() {}

  // final TextEditingController email = TextEditingController();

  final initialCountryCodeOrPrefix = "PK";
  String phone = '';
  // final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  onClickLogin() async {
    if (phone.isNotEmpty && phoneController.text.length > 4) {
      setBusy(true);
      try {
        bool didLogin = await supabaseAuthService.login(
          phone,
        );

        if (didLogin) {
          Constants.customSuccessSnack(
            'Please enter the code sent to $phone to login!',
          );
          setBusy(false);
          NavService.navigateToverifyOtp(
            arguments: VerifyOtpViewArguments(
              phone: phone,
              mode: VerificationMode.login,
              email: null,
              name: null,
            ),
          );
        }
        // NavService.navigateToverifyOtp(
        //   arguments: VerifyOtpViewArguments(
        //     phone: phone,
        //     mode: VerificationMode.login,
        //     email: null,
        //     name: null,
        //     isCustomer: null,
        //   ),
        // );
        setBusy(false);
      } on AuthExcepection catch (e) {
        setBusy(false);
        print(e);
        Constants.customErrorSnack(e.message);
      } on CustomNoInternetException catch (e) {
        print(e.message);
        Constants.customErrorSnack(e.message);
        setBusy(false);
      } catch (e) {
        setBusy(false);
        print(e);
        Constants.customErrorSnack(e.toString());
      }
    } else {
      print('not validated');
    }
    // NavService.navigateToProfile();
    // if (formKey.currentState!.validate()) {
    //   setBusy(true);
    //   try {
    //     AppUser? user = await supabaseAuthService.login(
    //       email.text.trim(),
    //       password.text.trim(),
    //     );

    //     if (user != null && supabaseAuthService.userLoggedIn) {
    //       Constants.customSuccessSnack('Welcome back, ${user.name}!');
    //       setBusy(false);
    //       NavService.customerDashboard();
    //     }
    //     setBusy(false);
    //   } on AuthExcepection catch (e) {
    //     setBusy(false);
    //     print(e);
    //     Constants.customErrorSnack(e.message);
    //   } on CustomNoInternetException catch (e) {
    //     print(e.message);
    //     Constants.customErrorSnack(e.message);
    //     setBusy(false);
    //   } catch (e) {
    //     setBusy(false);
    //     print(e);
    //     Constants.customErrorSnack(e.toString());
    //   }
    // }
  }

  onClickRegister() {
    // NavService.selectRole();
    NavService.register();
  }

  bool hidePassword = true;
  toggleObscureText() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}
