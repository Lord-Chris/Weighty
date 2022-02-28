import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weighty/core/locator.dart';
import 'package:weighty/core/routes.dart';
import 'package:weighty/services/_services.dart';
import 'package:weighty/ui/views/splash_view/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weighty',
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashView(),
    );
  }
}
