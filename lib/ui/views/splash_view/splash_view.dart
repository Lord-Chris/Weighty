import 'package:flutter/material.dart';
import 'package:weighty/ui/constants/_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Widgety",
          style: kHeaderStyle,
        ),
      ),
    );
  }
}
