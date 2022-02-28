import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/ui/constants/_constants.dart';
import 'package:weighty/ui/shared/_shared.dart';
import 'package:weighty/ui/views/login_view/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            const Text(
              "Weighty",
              style: kHeaderStyle,
            ),
            const YMargin(50),
            const Text(
              "The number one weight tracker",
              style: kBodyStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ViewModelBuilder<LoginViewmodel>.reactive(
              builder: (__, model, child) {
                return Center(
                  child: AppButton(
                    isBusy: model.isBusy,
                    label: "SIGN IN",
                    onTap: () => model.onSignInPress(),
                  ),
                );
              },
              viewModelBuilder: () => LoginViewmodel(),
            ),
            const YMargin(10),
            const Text(
              "**This will sign you in anonymously",
              style: kSubBodyStyle,
            ),
            const YMargin(32),
          ],
        ),
      ),
    );
  }
}
