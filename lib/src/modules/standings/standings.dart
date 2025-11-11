import 'package:apex/src/api/api.dart';
import 'package:apex/src/models/standings/driver_standing.dart';
import 'package:apex/src/models/standings/team_standing.dart';
import 'package:flutter/material.dart';

import 'components/drivers_standings.dart';
import 'components/team_standings.dart';

enum StandingsTab {
  drivers,
  teams;

  String get title => switch (this) {
    StandingsTab.drivers => 'Drivers',
    StandingsTab.teams => 'Teams',
  };
}

class StandingsPage extends StatefulWidget {
  const StandingsPage({super.key});

  @override
  State<StandingsPage> createState() => _StandingsPageState();
}

class _StandingsPageState extends State<StandingsPage> {
  List<DriverStanding> _driverStandings = [];
  List<TeamStanding> _teamStandings = [];

  StandingsTab _selectedTab = StandingsTab.drivers;

  void _onTabSelected(StandingsTab tab) => setState(() {
    _selectedTab = tab;
  });

  void _fetchDriverStandings() async {
    final (error, driverStandings) = await API.standings.getDriverStandings(
      year: DateTime.now().year,
    );

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    }
    setState(() {
      _driverStandings = driverStandings;
    });
  }

  void _fetchTeamStandings() async {
    final (error, teamStandings) = await API.standings.getTeamStandings(
      year: DateTime.now().year,
    );

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(
            error,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
    setState(() {
      _teamStandings = teamStandings;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDriverStandings();
    _fetchTeamStandings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Standings')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: switch (_selectedTab) {
              StandingsTab.drivers => DriversStandings(
                driverStandings: _driverStandings,
              ),
              StandingsTab.teams => TeamStandings(
                teamStandings: _teamStandings,
              ),
            },
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 30.0,
                  offset: Offset(0.0, -20.0),
                ),
              ],
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 2,
                  children: StandingsTab.values.map(
                    (tab) {
                      final isActive = _selectedTab == tab;

                      return GestureDetector(
                        onTap: () => _onTabSelected(tab),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.white : null,
                            borderRadius: BorderRadius.circular(
                              isActive ? 100.0 : 0.0,
                            ),
                          ),
                          child: Text(
                            tab.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: isActive
                                  ? Colors.black
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
