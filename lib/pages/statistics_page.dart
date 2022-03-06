import 'package:flutter/material.dart';

import 'package:brasileirao/models/team.dart';

class StatisticsPage extends StatelessWidget {
  final Team team;

  const StatisticsPage({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Image.network(team.image.replaceAll('40x40', '100x100')),
        ),
        Text(
          'Pontos: ${team.points}',
          style: const TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
