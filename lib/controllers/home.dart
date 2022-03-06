import '../models/team.dart';
import '../repositories/teams.dart';

class HomeController {
  TeamsRepository teamsRepository = TeamsRepository();

  List<Team> get classification => teamsRepository.teams;
}
