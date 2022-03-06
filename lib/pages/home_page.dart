import 'package:brasileirao/pages/team_page.dart';
import 'package:flutter/material.dart';

import '../controllers/home.dart';
import '../models/team.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Brasileirão')),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          final List<Team> classification = controller.classification;

          return ListTile(
            leading: Image.network(classification[i].image),
            title: Text(classification[i].name),
            trailing: Text(
              classification[i].points.toString(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TeamPage(
                      key: Key(classification[i].name),
                      team: classification[i]),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: controller.classification.length,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
