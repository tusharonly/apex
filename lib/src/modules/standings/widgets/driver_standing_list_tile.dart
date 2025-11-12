import 'package:apex/src/models/standings/driver_standing.dart';
import 'package:flutter/material.dart';

class DriverStandingListTile extends StatelessWidget {
  const DriverStandingListTile({
    super.key,
    required this.driverStanding,
    required this.prevPoints,
    required this.index,
  });

  final DriverStanding driverStanding;
  final int prevPoints;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        driverStanding.position.toString().padLeft(2, '0'),
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
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
          if (index > 0)
            Text(
              (driverStanding.points - prevPoints).toString(),
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
