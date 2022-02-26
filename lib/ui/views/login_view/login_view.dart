import 'package:flutter/material.dart';
import 'package:weighty/ui/constants/_constants.dart';
import 'package:weighty/ui/shared/_shared.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Text(
              "Widgety",
              style: kHeaderStyle,
            ),
            const YMargin(50),
            const Text(
              "The number one app for tracking weight",
              style: kMainStyle,
            ),
            const YMargin(50),
            AppButton(
              label: "Sign In",
              onTap: () {},
            ),
            const YMargin(10),
            const Text(
              "**This will sign you in anonymous",
              style: kMainStyle,
            ),
          ],
        ),
      ),
    );
  }
}
