import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weighty/core/models/weight_input_model.dart';
import 'package:weighty/ui/constants/_constants.dart';
import 'package:weighty/ui/shared/_shared.dart';
import 'package:weighty/ui/views/home_view/weight_input_sheet.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showDialog(
                  context: context, builder: (_) => WeightInputSheet(model));
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 70,
            title: const Text(
              "Weighty",
              style: kAppbarStyle,
            ),
            actions: [
              IconButton(
                onPressed: () => model.signOutUser(),
                icon: const Icon(
                  Icons.logout,
                  size: 25,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  StreamBuilder<List<WeightInput>>(
                    stream: model.stream,
                    builder: (context, snapshot) {
                      final _info = snapshot.data ?? [];
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          _info.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(25, 10, 8, 0),
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
          buttonPadding: const EdgeInsets.all(5),
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: AppColors.main,
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) => WeightInputSheet(viewModel, weight: data),
                );
              },
            ),
            IconButton(
              padding: const EdgeInsets.all(5),
              icon: const Icon(Icons.delete),
              color: AppColors.main,
              onPressed: () => viewModel.deleteWeight(data!),
            ),
          ],
        ),
      ),
    );
  }
}
