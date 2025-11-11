import 'package:flutter/material.dart';

class DriverStanding {
  final String driverFirstName;
  final String driverLastName;
  final String teamName;
  final int points;
  final int position;
  final String? teamColorString;

  DriverStanding({
    required this.driverFirstName,
    required this.driverLastName,
    required this.teamName,
    required this.points,
    required this.position,
    this.teamColorString,
  });

  Color? get teamColor => teamColorString != null
      ? Color(
          int.parse(teamColorString!.replaceAll('#', ''), radix: 16),
        ).withValues(alpha: 1)
      : null;
}
