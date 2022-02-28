import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';

import 'helpers.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

@GenerateMocks([
  MockMethodChannel,
], customMocks: [
  MockSpec<IAuthenticationService>(
      as: #MockAuthenticationService, returnNullOnMissingStub: true),
  MockSpec<INavigationService>(
      as: #MockNavigationService, returnNullOnMissingStub: true),
  MockSpec<IFirestoreService>(
      as: #MockFirestoreService, returnNullOnMissingStub: true),
])
void main() {
  var authService = getAndRegisterAuthenticationServiceMock();

  group('Authentication Service Test - ', () {
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      locator.allowReassignment = true;
    });

    test('Before Sign in Anonmously, current user should be null', () {
      locator.registerSingleton<IAuthenticationService>(authService);
      expect(authService.currentUser == null, true);
    });

    test('On Sign in Anonmously, verify that method is called once - ',
        () async {
      await authService.signInAnonymously();
      verify(authService.signInAnonymously()).called(1);
    });

    test('After Sign Out, current user should be null - ', () async {
      locator.registerSingleton<IAuthenticationService>(authService);
      await authService.signInAnonymously();
      expect(authService.currentUser == null, true);
    });
  });
}
