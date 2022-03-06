import 'package:flutter/material.dart';

import 'package:brasileirao/models/team.dart';

class TitlesPage extends StatelessWidget {
  final Team team;

  const TitlesPage({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return team.championships.isEmpty
        ? const Center(child: Text('Nenhum título ainda!'))
        : ListView.separated(
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(team.championships[i].competition),
                trailing: Text(team.championships[i].year),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: team.championships.length,
          );
  }
}
