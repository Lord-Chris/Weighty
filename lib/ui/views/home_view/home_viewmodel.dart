import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';

class HomeViewmodel extends StreamViewModel {
  final _firestoreService = locator<IFirestoreService>();
  final _authService = locator<IAuthenticationService>();
  final _navService = locator<INavigationService>();

  Future<void> addWeight(String input) async {
    try {
      final data = WeightInput(
        weight: double.parse(input),
        dateTime: DateTime.now(),
      );
      setBusy(true);
      await _firestoreService.addWeight(data);
      setBusy(false);
      _navService.back();
    } on FirebaseException catch (e) {
      setBusy(false);
    }
  }

  Future<void> updateWeight(WeightInput input) async {
    try {
      setBusy(true);
      await _firestoreService.updateWeight(input);
      setBusy(false);
      _navService.back();
    } on FirebaseException catch (e) {
      setBusy(false);
    }
  }

  Future<void> deleteWeight(WeightInput input) async {
    try {
      setBusy(true);
      await _firestoreService.deleteWeight(input);
      setBusy(false);
    } on FirebaseException catch (e) {
      setBusy(false);
    }
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
