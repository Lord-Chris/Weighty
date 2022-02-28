import 'package:get_it/get_it.dart';
import 'package:weighty/services/_services.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<INavigationService>(() => NavigationService());
  locator.registerLazySingleton<IFirestoreService>(() => FirestoreService());
  locator.registerLazySingleton<IAuthenticationService>(
      () => AuthenticationService());
}
