import 'package:flutter/material.dart';

import '../models/screen_item.dart';
import 'gradient_cta_button.dart';
import 'status_chip.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({
    super.key,
    required this.item,
  });

  final ScreenItem item;

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
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.phone_android, size: 16, color: Color(0xFF8065D6)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: item.tags.map((tag) => StatusChip(label: tag)).toList(),
            ),
            const Spacer(),
            GradientCtaButton(
              label: item.cta,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Action tapped: ${item.title}')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
