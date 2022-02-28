import 'package:stacked/stacked.dart';
import 'package:weighty/core/routes.dart';
import 'package:weighty/services/authentication_service.dart';
import 'package:weighty/services/navigation_service.dart';

class SplashViewmodel extends BaseViewModel {
  final _authService = AuthenticationService();
  final _navService = NavigationService.instance;

  Future<void> checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_authService.currentUser == null) {
      _navService.toNamed(Routes.loginRoute);
    } else {
      _navService.toNamed(Routes.homeRoute);
    }
  }
}
