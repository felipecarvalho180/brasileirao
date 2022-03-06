import 'package:brasileirao/widgets/logo.dart';
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
          child: Logo(
            image: team.image,
            width: 250,
          ),
        ),
        Text(
          'Pontos: ${team.points}',
          style: const TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
