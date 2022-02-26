import 'package:flutter/material.dart';
import 'package:weighty/ui/constants/_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const InkWell(
              child: Text(
                "Log out",
                style: kBodyStyle,
              ),
            ),
            const Text(
              "Widgety",
              style: kHeaderStyle,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (__, index) {
                  return ListTile(
                    title: const Text("WEIGHT"),
                    subtitle: const Text("Time"),
                    trailing: ButtonBar(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
