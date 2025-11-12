import 'package:apex/src/models/standings/driver_standing.dart';
import 'package:flutter/material.dart';

import '../widgets/driver_standing_list_tile.dart';

class DriversStandings extends StatelessWidget {
  const DriversStandings({super.key, required this.driverStandings});

  final List<DriverStanding> driverStandings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 16),
            separatorBuilder: (context, index) => SizedBox(height: 8.0),
            itemBuilder: (context, index) {
              final driverStanding = driverStandings[index];
              final prevPoints = index > 0
                  ? driverStandings[index - 1].points
                  : 0;

              return DriverStandingListTile(
                driverStanding: driverStanding,
                prevPoints: prevPoints,
                index: index,
              );
            },
            itemCount: driverStandings.length,
          ),
        ),
      ],
    );
  }
}
