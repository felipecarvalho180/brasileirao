import '../models/team_model.dart';
import '../repositories/teams_repository.dart';

class HomeController {
  TeamsRepository teamsRepository = TeamsRepository();

  List<Team> get classification => teamsRepository.teams;
}
