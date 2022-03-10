import 'package:brasileirao/pages/edit_title_page.dart';
import 'package:flutter/material.dart';

import 'package:brasileirao/models/team_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../repositories/teams_repository.dart';

class TitlesPage extends StatelessWidget {
  final Team team;

  const TitlesPage({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamFound = Provider.of<TeamsRepository>(context)
        .teams
        .firstWhere((t) => t.name == team.name);

    final quantity = teamFound.championships.length;

    return quantity == 0
        ? const Center(child: Text('Nenhum título ainda!'))
        : ListView.separated(
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(teamFound.championships[i].competition),
                trailing: Text(teamFound.championships[i].year),
                onTap: () {
                  Get.to(
                    EditTitlePage(
                      championship: teamFound.championships[i],
                    ),
                    fullscreenDialog: true,
                  );
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: team.championships.length,
          );
  }
}
