import 'package:flutter/material.dart';

import 'championship.dart';

class Team {
  String name;
  String image;
  int points;
  Color color;
  List<Championship> championships = [];

  Team({
    required this.name,
    required this.image,
    required this.points,
    required this.color,
  });
}
