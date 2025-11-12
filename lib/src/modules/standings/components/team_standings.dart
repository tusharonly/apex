import 'package:apex/src/models/standings/team_standing.dart';
import 'package:flutter/material.dart';

import '../widgets/team_standing_list_tile.dart';

class TeamStandings extends StatelessWidget {
  const TeamStandings({super.key, required this.teamStandings});

  final List<TeamStanding> teamStandings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 16),
            separatorBuilder: (context, index) => SizedBox(height: 12.0),
            itemBuilder: (context, index) {
              final teamStanding = teamStandings[index];
              final prevPoints = index > 0
                  ? teamStandings[index - 1].points
                  : 0;

              return TeamStandingListTile(
                teamStanding: teamStanding,
                prevPoints: prevPoints,
                index: index,
              );
            },
            itemCount: teamStandings.length,
          ),
        ),
      ],
    );
  }
}
