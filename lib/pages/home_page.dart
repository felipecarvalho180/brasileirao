import 'package:brasileirao/pages/team_page.dart';
import 'package:brasileirao/repositories/teams.dart';
import 'package:brasileirao/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<TeamsRepository>(builder: (context, value, child) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int i) {
            final List<Team> classification = value.teams;

            return ListTile(
              leading: Logo(
                image: classification[i].image,
                width: 40,
              ),
              title: Text(classification[i].name),
              subtitle: Text(
                'Titulos: ${classification[i].championships.length}',
              ),
              trailing: Text(
                classification[i].points.toString(),
              ),
              onTap: () {
                Get.to(
                  () => TeamPage(
                    key: Key(classification[i].name),
                    team: classification[i],
                  ),
                );
              },
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: value.teams.length,
          padding: const EdgeInsets.all(16),
        );
      }),
    );
  }
}
