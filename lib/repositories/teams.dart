import 'package:flutter/material.dart';

import '../models/championship.dart';
import '../models/team.dart';

class TeamsRepository {
  final List<Team> _teams = [];

  get teams => _teams;

  void addChampionship(
      {required Team team, required Championship championship}) {
    team.championships.add(championship);
  }

  TeamsRepository() {
    _teams.addAll([
      Team(
        name: 'Flamengo',
        points: 71,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Internacional',
        points: 69,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Atlético-MG',
        points: 65,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-mg.png',
        color: (Colors.grey[800])!,
      ),
      Team(
        name: 'São Paulo',
        points: 63,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/sao-paulo.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Fluminense',
        points: 61,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
        color: (Colors.teal[800])!,
      ),
      Team(
        name: 'Grêmio',
        points: 59,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/gremio.png',
        color: (Colors.blue[900])!,
      ),
      Team(
        name: 'Palmeiras',
        points: 58,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
        color: (Colors.green[800])!,
      ),
      Team(
        name: 'Santos',
        points: 54,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
        color: (Colors.grey[800])!,
      ),
      Team(
        name: 'Athletico-PR',
        points: 50,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-pr.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Corinthians',
        points: 50,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
        color: (Colors.grey[800])!,
      ),
      Team(
        name: 'Bragantino',
        points: 50,
        image:
            'https://e.imguol.com/futebol/brasoes/40x40/red-bull-bragantino.png',
        color: (Colors.grey[800])!,
      ),
      Team(
        name: 'Ceará',
        points: 49,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/ceara.png',
        color: (Colors.grey[800])!,
      ),
      Team(
        name: 'Atlético-GO',
        points: 47,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/atletico-go.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Sport',
        points: 42,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/sport.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Bahia',
        points: 41,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/bahia.png',
        color: (Colors.blue[900])!,
      ),
      Team(
        name: 'Fortaleza',
        points: 41,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/fortaleza.png',
        color: (Colors.red[900])!,
      ),
      Team(
        name: 'Vasco',
        points: 38,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/vasco.png',
        color: (Colors.grey[800])!,
      ),
      Team(
        name: 'Goiás',
        points: 37,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/goias.png',
        color: (Colors.green[900])!,
      ),
      Team(
        name: 'Coritiba',
        points: 31,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
        color: (Colors.green[900])!,
      ),
      Team(
        name: 'Botafogo',
        points: 27,
        image: 'https://e.imguol.com/futebol/brasoes/40x40/botafogo.png',
        color: (Colors.grey[800])!,
      ),
    ]);
  }
}
