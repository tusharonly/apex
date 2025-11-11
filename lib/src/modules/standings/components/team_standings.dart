import 'package:flutter/material.dart';

class TeamStandings extends StatelessWidget {
  const TeamStandings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text('Team Standings'),
    );
  }
}
