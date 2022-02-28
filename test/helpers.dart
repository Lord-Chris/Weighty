import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';

import 'auth_serivice_test.mocks.dart';

IAuthenticationService getAndRegisterAuthenticationServiceMock() {
  var service = MockAuthenticationService();
  locator.registerSingleton<IAuthenticationService>(service);
  return service;
}

INavigationService getAndRegisterNavigationServiceMock() {
  var service = MockNavigationService();
  locator.registerSingleton<INavigationService>(service);
  return service;
}

IFirestoreService getAndRegisterFirestoreServiceMock() {
  var service = MockFirestoreService();
  locator.registerSingleton<IFirestoreService>(service);
  return service;
}
