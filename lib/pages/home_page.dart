import 'package:brasileirao/controllers/theme_controller.dart';
import 'package:brasileirao/pages/team_page.dart';
import 'package:brasileirao/repositories/teams_repository.dart';
import 'package:brasileirao/services/auth_service.dart';
import 'package:brasileirao/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/team_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeController themeController = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(
                    () => themeController.isDark.value
                        ? const Icon(Icons.brightness_7)
                        : const Icon(Icons.brightness_2),
                  ),
                  title: Obx(
                    () => themeController.isDark.value
                        ? const Text('light')
                        : const Text('dark'),
                  ),
                  onTap: () => themeController.changeTheme(),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sair'),
                  onTap: () {
                    Navigator.pop(context);
                    AuthService.to.logout();
                  },
                ),
              )
            ],
          ),
        ],
      ),
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
