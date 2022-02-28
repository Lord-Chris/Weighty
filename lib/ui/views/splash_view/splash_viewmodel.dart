import 'package:stacked/stacked.dart';
import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';

class SplashViewmodel extends BaseViewModel {
  final _authService = locator<IAuthenticationService>();
  final _navService = locator<INavigationService>();

  Future<void> checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_authService.currentUser == null) {
      _navService.toNamed(Routes.loginRoute);
    } else {
      _navService.toNamed(Routes.homeRoute);
    }
  }
}
