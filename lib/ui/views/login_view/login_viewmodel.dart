import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/routes.dart';
import 'package:weighty/services/authentication_service.dart';
import 'package:weighty/services/navigation_service.dart';

class LoginViewmodel extends BaseViewModel {
  final _authService = AuthenticationService();
  final _navService = NavigationService();

  Future<void> onSignInPress() async {
    try {
      setBusy(true);
      await _authService.signInAnonymously();
      setBusy(false);
      _navService.offNamed(Routes.homeRoute);
    } on FirebaseAuthException catch (e) {
      // print("ERR $e");
      setBusy(false);
    }
  }
}
