import 'package:brasileirao/models/team_model.dart';
import 'package:brasileirao/repositories/teams_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();

  Future<Database> get database async {
    return await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

  initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), "dados.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(teams);
        await db.execute(championships);
        await setupTeams(db);
      },
    );
  }

  setupTeams(Database db) {
    for (Team team in TeamsRepository.setupTeams()) {
      db.insert(
        "teams",
        {
          "name": team.name,
          "image": team.image,
          "points": team.points,
          "color":
              team.color.toString().replaceAll('Color(', '').replaceAll(')', '')
        },
      );
    }
  }

  String get teams =>
      "CREATE TABLE teams(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, points INTEGER, image TEXT, color TEXT)";

  String get championships =>
      "CREATE TABLE championships(id INTEGER PRIMARY KEY AUTOINCREMENT, competition TEXT, year TEXT, team_id INTEGER, FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE )";
}
