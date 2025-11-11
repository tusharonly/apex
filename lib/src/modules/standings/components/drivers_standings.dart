import 'package:apex/src/models/standings/driver_standings.dart';
import 'package:flutter/material.dart';

class DriversStandings extends StatelessWidget {
  const DriversStandings({super.key, required this.driverStandings});

  final List<DriverStanding> driverStandings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 12.0),
            itemBuilder: (context, index) {
              final driverStanding = driverStandings[index];
              final prevPoints = index > 0
                  ? driverStandings[index - 1].points
                  : 0;

              return ListTile(
                leading: Text(
                  driverStanding.position.toString(),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                titleAlignment: ListTileTitleAlignment.titleHeight,
                title: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Text(
                        '${driverStanding.driverFirstName} ${driverStanding.driverLastName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      driverStanding.points.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Text(
                        driverStanding.teamName,
                        style: TextStyle(
                          color: driverStanding.teamColor,
                        ),
                      ),
                    ),
                    Text(
                      index > 0
                          ? (driverStanding.points - prevPoints).toString()
                          : '',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: driverStandings.length,
          ),
        ),
      ],
    );
  }
}
