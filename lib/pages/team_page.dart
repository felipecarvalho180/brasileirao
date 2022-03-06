import 'package:brasileirao/models/championship.dart';
import 'package:brasileirao/pages/add_title_page.dart';
import 'package:brasileirao/pages/statistics_page.dart';
import 'package:brasileirao/pages/titles.dart';
import 'package:flutter/material.dart';

import '../models/team.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  const TeamPage({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  void handleAddTitle() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTitlePage(
          team: widget.team,
          onSubmit: handleSaveTitle,
        ),
      ),
    );
  }

  void handleSaveTitle(Championship title) {
    setState(() {
      widget.team.championships.add(title);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Salvo com sucesso!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.team.name),
          backgroundColor: widget.team.color,
          actions: [
            IconButton(onPressed: handleAddTitle, icon: const Icon(Icons.add))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_bar_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            StatisticsPage(team: widget.team),
            TitlesPage(team: widget.team),
          ],
        ),
      ),
    );
  }
}
