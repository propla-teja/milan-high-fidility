import 'package:flutter/material.dart';

import '../../data/repositories/mock_milan_repository.dart';
import 'home_flow_screen.dart';
import 'matches_screen.dart';
import 'moderation_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.repository,
  });

  final MockMilanRepository repository;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeFlowScreen(repository: widget.repository),
      MatchesScreen(repository: widget.repository),
      ModerationScreen(repository: widget.repository),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.mobile_friendly), label: 'Onboarding'),
          NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'Matches'),
          NavigationDestination(icon: Icon(Icons.admin_panel_settings_outlined), label: 'Safety'),
        ],
        onDestinationSelected: (value) => setState(() => _index = value),
      ),
    );
  }
}
