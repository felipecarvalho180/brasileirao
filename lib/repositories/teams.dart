import 'package:flutter/material.dart';
import 'dart:collection';

import '../models/championship.dart';
import '../models/team.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];

  UnmodifiableListView<Team> get teams => UnmodifiableListView(_teams);

  void addChampionship({
    required Team team,
    required Championship championship,
  }) {
    team.championships.add(championship);
    notifyListeners();
  }

  void editChampionship({
    required Championship championship,
    required String newChampionshipName,
    required String newChampionshipYear,
  }) {
    championship.competition = newChampionshipName;
    championship.year = newChampionshipYear;
    notifyListeners();
  }

  TeamsRepository() {
    _teams.addAll(
      [
        Team(
          name: 'Flamengo',
          points: 0,
          image: 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
          color: (Colors.red[900])!,
          idAPI: 18,
        ),
        Team(
          name: 'Internacional',
          points: 0,
          image:
              'https://logodetimes.com/times/internacional/logo-internacional-256.png',
          color: (Colors.red[900])!,
          idAPI: 44,
        ),
        Team(
          name: 'Atlético-MG',
          points: 0,
          image:
              'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png',
          color: (Colors.grey[800])!,
          idAPI: 30,
        ),
        Team(
          name: 'São Paulo',
          points: 0,
          image:
              'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
          color: (Colors.red[900])!,
          idAPI: 57,
        ),
        Team(
          name: 'Fluminense',
          points: 0,
          image:
              'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
          color: (Colors.teal[800])!,
          idAPI: 26,
        ),
        Team(
          name: 'Grêmio',
          points: 0,
          image: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
          color: (Colors.blue[900])!,
          idAPI: 45,
        ),
        Team(
          name: 'Palmeiras',
          points: 0,
          image:
              'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
          color: (Colors.green[800])!,
          idAPI: 56,
        ),
        Team(
          name: 'Santos',
          points: 0,
          image: 'https://logodetimes.com/times/santos/logo-santos-256.png',
          color: (Colors.grey[800])!,
          idAPI: 63,
        ),
        Team(
          name: 'Athletico-PR',
          points: 0,
          image:
              'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png',
          color: (Colors.red[900])!,
          idAPI: 185,
        ),
        Team(
          name: 'Corinthians',
          points: 0,
          image:
              'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
          color: (Colors.grey[800])!,
          idAPI: 65,
        ),
        Team(
          name: 'Bragantino',
          points: 0,
          image:
              'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png',
          color: (Colors.grey[800])!,
          idAPI: 64,
        ),
        Team(
          name: 'Ceará',
          points: 0,
          image: 'https://logodetimes.com/times/ceara/logo-ceara-256.png',
          color: (Colors.grey[800])!,
          idAPI: 105,
        ),
        Team(
          name: 'Atlético-GO',
          points: 0,
          image:
              'https://logodetimes.com/times/atletico-goianiense/logo-atletico-goianiense-256.png',
          color: (Colors.red[900])!,
          idAPI: 98,
        ),
        Team(
          name: 'Sport',
          points: 0,
          image:
              'https://logodetimes.com/times/sport-recife/logo-sport-recife-256.png',
          color: (Colors.red[900])!,
          idAPI: 79,
        ),
        Team(
          name: 'Bahia',
          points: 0,
          image: 'https://logodetimes.com/times/bahia/logo-bahia-256.png',
          color: (Colors.blue[900])!,
          idAPI: 68,
        ),
        Team(
          name: 'Fortaleza',
          points: 0,
          image:
              'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
          color: (Colors.red[900])!,
          idAPI: 131,
        ),
        Team(
          name: 'Vasco',
          points: 0,
          image:
              'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png',
          color: (Colors.grey[800])!,
          idAPI: 23,
        ),
        Team(
          name: 'Goiás',
          points: 0,
          image: 'https://logodetimes.com/times/goias/logo-goias-novo-256.png',
          color: (Colors.green[900])!,
          idAPI: 115,
        ),
        Team(
          name: 'Coritiba',
          points: 0,
          image: 'https://logodetimes.com/times/coritiba/logo-coritiba-5.png',
          color: (Colors.green[900])!,
          idAPI: 84,
        ),
        Team(
          name: 'Botafogo',
          points: 0,
          image: 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png',
          color: (Colors.grey[800])!,
          idAPI: 22,
        ),
      ],
    );
  }
}
