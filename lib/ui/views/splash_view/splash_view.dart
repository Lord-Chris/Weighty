import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/ui/constants/_constants.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewmodel>.nonReactive(
      onModelReady: (model) => model.checkUserStatus(),
      viewModelBuilder: () => SplashViewmodel(),
      builder: (__, model, _) {
        return const Scaffold(
          body: Center(
            child: Text(
              "Widgety",
              style: kHeaderStyle,
            ),
          ),
        );
      },
    );
  }
}
