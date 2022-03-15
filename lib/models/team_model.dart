import 'package:flutter/material.dart';

import 'championship_model.dart';

class Team {
  int? id;
  String name;
  String image;
  int points;
  Color color;
  int? idAPI;
  List<Championship>? championships = [];

  Team({
    this.id,
    required this.name,
    required this.image,
    required this.points,
    required this.color,
    this.idAPI,
    this.championships,
  });
}
