import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:weighty/core/models/weight_input_model.dart';
import 'package:weighty/core/routes.dart';
import 'package:weighty/services/authentication_service.dart';
import 'package:weighty/services/firestore_services.dart';
import 'package:weighty/services/navigation_service.dart';

class HomeViewmodel extends StreamViewModel {
  final _firestoreService = FirestoreService();
  final _authService = AuthenticationService();
  final _navService = NavigationService();

  Future<void> addWeight(String input) async {
    final data = WeightInput(
      weight: double.parse(input),
      dateTime: DateTime.now(),
    );
    setBusy(true);
    await _firestoreService.addWeight(data);
    setBusy(false);
    _navService.back();
  }

  Future<void> signOutUser() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 500));
    await _authService.logOut();
    _navService.offAllNamed(Routes.loginRoute, (route) => route.isFirst);
    setBusy(false);
  }

  @override
  Stream<List<WeightInput>> get stream => _firestoreService.weightStream();
}
