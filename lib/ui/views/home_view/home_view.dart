import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/models/weight_input_model.dart';
import 'package:weighty/ui/constants/_constants.dart';
import 'package:weighty/ui/shared/_shared.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showDialog(
                  context: context, builder: (_) => WeightInputSheet(model));
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          body: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      TextButton(
                        onPressed: () => model.signOutUser(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Log out",
                              style: kMainStyle.copyWith(fontSize: 20),
                            ),
                            const Icon(
                              Icons.logout,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Weighty",
                        style: kHeaderStyle,
                      ),
                      Expanded(
                        child: StreamBuilder<List<WeightInput>>(
                          stream: model.stream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: Text(
                                  "No weight added yet",
                                  style: kBodyStyle,
                                ),
                              );
                            }
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text(
                                  "Error Found",
                                  style: kBodyStyle,
                                ),
                              );
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (__, index) {
                                final data = snapshot.data?[index];
                                return ListTile(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 16, 0),
                                  title: Text(
                                    "You weigh: ${data?.weight}kg",
                                    style: kBodyStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "${data?.dateString}",
                                    style: kSubBodyStyle,
                                  ),
                                  trailing: ButtonBar(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: model.isBusy,
                    child: Container(
                      color: Colors.black12,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

final _formKey = GlobalKey<FormState>();

class WeightInputSheet extends StatelessWidget {
  WeightInputSheet(this.model, {Key? key}) : super(key: key);
  final HomeViewmodel model;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.all(20),
        // clipBehavior: Clip.hardEdge,
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
                label: "Weight",
              ),
              const YMargin(20),
              AppButton(
                label: "ADD WEIGHT",
                onTap: () {
                  if (!_formKey.currentState!.validate()) return;
                  model.addWeight(_controller.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
