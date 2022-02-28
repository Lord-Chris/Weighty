import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';
import 'package:weighty/ui/views/home_view/home_viewmodel.dart';
import 'package:weighty/ui/views/login_view/login_viewmodel.dart';

import 'helpers.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

@GenerateMocks([
  MockMethodChannel,
], customMocks: [
  MockSpec<IAuthenticationService>(
    as: #MockAuthenticationService,
    returnNullOnMissingStub: true,
  ),
  MockSpec<INavigationService>(
    as: #MockNavigationService,
    returnNullOnMissingStub: true,
  ),
  MockSpec<IFirestoreService>(
    as: #MockFirestoreService,
    returnNullOnMissingStub: true,
  ),
])
final mockEntry = WeightInput(weight: 100, dateTime: DateTime.now());
void main() {
  var authService = getAndRegisterAuthenticationServiceMock();
  var navService = getAndRegisterNavigationServiceMock();
  var firetoreService = getAndRegisterFirestoreServiceMock();

  group("Login Viewmodel - ", (() {
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      locator.allowReassignment = true;
    });

    test(
        "On Add Weight Call, method should run successfully, verify that sign in anon is called and the page is navigated to home page - ",
        () async {
      var loginViewmodel = LoginViewmodel();
      await loginViewmodel.onSignInPress();
      verify(authService.signInAnonymously()).called(1);
      verify(navService.offNamed(Routes.homeRoute)).called(1);
    });
  }));

  group("Home Viewmodel - ", (() {
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      locator.allowReassignment = true;
    });

    test(
        "On Add Weight Call, method should run successfully and the dialog should close - ",
        () async {
      var homeviewmodel = HomeViewmodel();
      await homeviewmodel.addWeight("100");
      verify(navService.back());
    });

    test(
        "On Update Weight Call, method should run successfully and the dialog should close - ",
        () async {
      var homeviewmodel = HomeViewmodel();
      await homeviewmodel.updateWeight(mockEntry);
      verify(navService.back()).called(1);
    });

    test(
        "On Delete Weight Call, method should run successfully and delete weight service must be called - ",
        () async {
      var homeviewmodel = HomeViewmodel();
      await homeviewmodel.deleteWeight(mockEntry);
      verify(firetoreService.deleteWeight(mockEntry)).called(1);
    });

    test(
        "On Signout Call, method should run successfully and the page should be navigated to login screen - ",
        () async {
      var homeviewmodel = HomeViewmodel();
      await homeviewmodel.signOutUser();
      verify(navService.offNamed(Routes.loginRoute)).called(1);
    });
  }));
}
