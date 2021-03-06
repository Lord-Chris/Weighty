import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';
import 'package:weighty/ui/constants/colors.dart';
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
      scaffoldMessengerKey: ToastMixin.scaffoldkey,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        primarySwatch: AppColors.main,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      home: const SplashView(),
    );
  }
}
