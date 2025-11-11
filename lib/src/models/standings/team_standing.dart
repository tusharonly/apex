import 'package:flutter/material.dart';

class TeamStanding {
  final String teamName;
  final int points;
  final int position;
  final String? teamColorString;
  final String? teamLogoUrl;

  TeamStanding({
    required this.teamName,
    required this.points,
    required this.position,
    this.teamColorString,
    this.teamLogoUrl,
  });

  Color? get teamColor => teamColorString != null
      ? Color(
          int.parse(teamColorString!.replaceAll('#', ''), radix: 16),
        ).withValues(alpha: 1)
      : null;
}
