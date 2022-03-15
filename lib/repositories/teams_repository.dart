import 'dart:convert';
import 'dart:io';

import 'package:brasileirao/database/db.dart';
import 'package:brasileirao/database/db_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:http/http.dart' as http;

import '../models/championship_model.dart';
import '../models/team_model.dart';

class TeamsRepository extends ChangeNotifier {
  final List<Team> _teams = [];
  final loading = ValueNotifier(false);

  UnmodifiableListView<Team> get teams => UnmodifiableListView(_teams);

  Future<void> addChampionship({
    required Team team,
    required Championship championship,
  }) async {
    FirebaseFirestore db = await DBFirestore.get();
    var docRef = await db.collection('titles').add({
      'team_id': team.idAPI,
      'competition': championship.competition,
      'year': championship.year,
    });

    championship.id = docRef.id;

    team.championships!.add(championship);
    notifyListeners();
  }

  Future<void> editChampionship({
    required Championship championship,
    required String newChampionshipName,
    required String newChampionshipYear,
  }) async {
    FirebaseFirestore db = await DBFirestore.get();
    await db.collection('titles').doc(championship.id).update({
      'competition': championship.competition,
      'year': championship.year,
    });

    championship.competition = newChampionshipName;
    championship.year = newChampionshipYear;
    notifyListeners();
  }

  static setupTeams() {
    return [
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
        image: 'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png',
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
        image: 'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
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
        image: 'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png',
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
    ];
  }

  TeamsRepository() {
    initRepository();
  }

  void showLoading(bool value) {
    loading.value = value;
    notifyListeners();
  }

  Future<void> updateTable() async {
    showLoading(true);
    try {
      //Código HTTP
      // final response = await http.get(
      //   Uri.parse('https://api.api-futebol.com.br/v1/campeonatos/10/fases/55'),
      //   headers: {
      //     HttpHeaders.authorizationHeader:
      //         "Bearer live_6b15276edb85937c131ffb1566f835"
      //   },
      // );

      //Código Dio
      final Dio http = Dio();
      final response = await http.get(
        'https://api.api-futebol.com.br/v1/campeonatos/10/fases/55',
        options: Options(
          headers: {
            'Authorization': "Bearer live_6b15276edb85937c131ffb1566f835"
          },
        ),
      );

      // final json = jsonDecode(response.body);
      final json = response.data;
      final table = json['tabela'];
      final db = await DB.get();

      table.forEach((item) async {
        final idAPI = item['time']['time_id'];
        final points = item['pontos'];

        await db.update(
          'teams',
          {'points': points},
          where: 'idAPI = ?',
          whereArgs: [idAPI],
        );

        Team team = _teams.firstWhere((element) => element.idAPI == idAPI);
        team.points = points;
        notifyListeners();
      });
    } catch (e) {
      print(e);
      // throw Exception('Falha ao pegar dados');
    } finally {
      showLoading(false);
    }
  }

  void initRepository() async {
    var db = await DB.get();
    List teams = await db.query("teams", orderBy: 'points DESC');

    for (var team in teams) {
      _teams.add(
        Team(
          name: team['name'],
          image: team['image'],
          points: team['points'],
          color: Color(int.parse(team['color'])),
          idAPI: team['idAPI'],
          championships: await getTitles(team['id']),
        ),
      );
    }

    updateTable();
    notifyListeners();
  }

  getTitles(teamId) async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapshot =
        await db.collection('titles').where('team_id', isEqualTo: teamId).get();

    List<Championship> titles = [];
    snapshot.docs.forEach(
      (element) {
        final data = element.data();
        titles.add(
          Championship(
            competition: data['competition'],
            year: data['year'],
            id: element.id,
          ),
        );
      },
    );

    return titles;
  }
}
