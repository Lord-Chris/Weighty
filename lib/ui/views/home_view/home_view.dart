import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/models/weight_input_model.dart';
import 'package:weighty/ui/constants/_constants.dart';
import 'package:weighty/ui/shared/_shared.dart';
import 'package:weighty/ui/views/home_view/weight_input_sheet.dart';

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
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final _info = snapshot.data!;
                            if (!snapshot.hasData || _info.isEmpty) {
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
                                return WeightInfoTile(data: data);
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

class WeightInfoTile extends ViewModelWidget<HomeViewmodel> {
  const WeightInfoTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final WeightInput? data;

  @override
  Widget build(BuildContext context, HomeViewmodel viewModel) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(25, 0, 16, 0),
      title: Text(
        "You weigh: ${data?.weight}kg",
        style: kBodyStyle.copyWith(fontWeight: FontWeight.bold),
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
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (_) => WeightInputSheet(viewModel, weight: data),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => viewModel.deleteWeight(data!),
          ),
        ],
      ),
    );
  }
}
