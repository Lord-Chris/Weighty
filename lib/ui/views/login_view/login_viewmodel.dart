import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';

class LoginViewmodel extends BaseViewModel {
  final _authService = locator<IAuthenticationService>();
  final _navService = locator<INavigationService>();

  Future<void> onSignInPress() async {
    try {
      setBusy(true);
      await _authService.signInAnonymously();
      setBusy(false);
      _navService.offNamed(Routes.homeRoute);
    } on FirebaseAuthException catch (e) {
      setBusy(false);
    }
  }
}
