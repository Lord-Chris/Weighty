import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/models/weight_input_model.dart';
import 'package:weighty/ui/constants/_constants.dart';
import 'package:weighty/ui/shared/_shared.dart';

import 'home_viewmodel.dart';

final _formKey = GlobalKey<FormState>();

class WeightInputSheet extends StatelessWidget {
  WeightInputSheet(this.model, {Key? key, this.weight}) : super(key: key);
  final HomeViewmodel model;
  final WeightInput? weight;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => model,
      disposeViewModel: false,
      onModelReady: (model) =>
          weight != null ? _controller.text = weight!.weight.toString() : null,
      builder: (context, model, _) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
          ),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const YMargin(20),
                const Text(
                  "Weighty",
                  style: kHeaderStyle,
                ),
                const YMargin(20),
                AppTextField(
                  controller: _controller,
                  validator: (val) => val == null || val.isEmpty
                      ? "Field must not be empty"
                      : null,
                  hint: "XXX",
                  label: "Weight in kg",
                ),
                const YMargin(20),
                AppButton(
                  label: "ADD WEIGHT",
                  isBusy: model.isBusy,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) return;
                    weight == null
                        ? model.addWeight(_controller.text)
                        : model.updateWeight(weight!.copyWith(
                            weight: double.parse(_controller.text),
                          ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
