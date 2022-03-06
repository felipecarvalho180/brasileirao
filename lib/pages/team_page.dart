import 'package:brasileirao/models/championship.dart';
import 'package:brasileirao/pages/add_title_page.dart';
import 'package:brasileirao/pages/statistics_page.dart';
import 'package:brasileirao/pages/titles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Get.to(() => AddTitlePage(team: widget.team));
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
