import 'package:flutter/material.dart';

import 'screens/milan_dashboard_screen.dart';
import 'theme/app_theme.dart';

class MilanApp extends StatelessWidget {
  const MilanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milan Professionals',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MilanDashboardScreen(),
    );
  }
}
