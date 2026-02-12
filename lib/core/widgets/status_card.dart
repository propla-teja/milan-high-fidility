import 'package:flutter/material.dart';

import '../../data/models/status_screen.dart';
import 'milan_button.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.item,
  });

  final StatusScreen item;

  Color _badgeColor(String level) {
    return switch (level) {
      'success' => const Color(0xFF52C69A),
      'error' => const Color(0xFFFF6B6B),
      'warning' => const Color(0xFFF4A100),
      _ => const Color(0xFF7E7AA6),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _badgeColor(item.level).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    item.level.toUpperCase(),
                    style: TextStyle(
                      color: _badgeColor(item.level),
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(item.icon, color: const Color(0xFF6E3CEB)),
              ],
            ),
            const SizedBox(height: 12),
            Text(item.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(item.description),
            const SizedBox(height: 14),
            MilanButton(label: item.ctaLabel, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
