import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'home.dart';
import 'news.dart';
import 'schedule.dart';
import 'settings.dart';
import 'standings/standings.dart';

enum RootPageTab {
  home,
  schedule,
  standings,
  news,
  settings;

  IconData get icon => switch (this) {
    RootPageTab.home => LucideIcons.galleryVerticalEnd,
    RootPageTab.schedule => LucideIcons.calendar,
    RootPageTab.standings => LucideIcons.trophy,
    RootPageTab.news => LucideIcons.newspaper,
    RootPageTab.settings => LucideIcons.settings,
  };
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  RootPageTab _selectedTab = RootPageTab.standings;

  void _onTabSelected(int index) => setState(() {
    _selectedTab = RootPageTab.values[index];
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab.index,
        children: RootPageTab.values.map((tab) {
          return switch (tab) {
            RootPageTab.home => HomePage(),
            RootPageTab.schedule => SchedulePage(),
            RootPageTab.standings => StandingsPage(),
            RootPageTab.news => NewsPage(),
            RootPageTab.settings => SettingsPage(),
          };
        }).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        height: kToolbarHeight,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: RootPageTab.values.map(
          (tab) {
            final isActive = _selectedTab == tab;
            return NavigationDestination(
              icon: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                decoration: isActive
                    ? BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(100.0),
                      )
                    : null,
                child: Icon(
                  tab.icon,
                  size: 22.0,
                  color: !isActive ? Colors.grey.shade900 : null,
                ),
              ),
              label: '',
            );
          },
        ).toList(),
        selectedIndex: _selectedTab.index,
        onDestinationSelected: _onTabSelected,
      ),
    );
  }
}
