import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'data/repositories/mock_milan_repository.dart';
import 'data/services/mock_json_service.dart';
import 'presentation/screens/dashboard_screen.dart';

class MilanApp extends StatelessWidget {
  const MilanApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = MockMilanRepository(
      service: const MockJsonService(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Milan Professionals',
      theme: AppTheme.light,
      home: DashboardScreen(repository: repository),
    );
  }
}
