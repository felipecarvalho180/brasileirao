import 'package:flutter/material.dart';

import 'championship_model.dart';

class Team {
  String name;
  String image;
  int points;
  Color color;
  int idAPI;
  List<Championship> championships = [];

  Team({
    required this.name,
    required this.image,
    required this.points,
    required this.color,
    required this.idAPI,
  });
}
