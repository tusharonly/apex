import 'package:apex/src/models/standings/team_standing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TeamStandingListTile extends StatelessWidget {
  const TeamStandingListTile({
    super.key,
    required this.teamStanding,
    required this.prevPoints,
    required this.index,
  });

  final TeamStanding teamStanding;
  final int prevPoints;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        teamStanding.position.toString().padLeft(2, '0'),
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
      titleAlignment: ListTileTitleAlignment.titleHeight,
      title: Row(
        spacing: 8,
        children: [
          Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: teamStanding.teamColor,
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: teamStanding.teamLogoUrl ?? '',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Text(
              teamStanding.teamName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            teamStanding.points.toString(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          if (index > 0)
            Text(
              (teamStanding.points - prevPoints).toString(),
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
