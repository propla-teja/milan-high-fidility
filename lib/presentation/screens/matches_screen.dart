import 'package:flutter/material.dart';

import '../../core/widgets/milan_button.dart';
import '../../core/widgets/user_avatar_tile.dart';
import '../../data/repositories/mock_milan_repository.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({
    super.key,
    required this.repository,
  });

  final MockMilanRepository repository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: repository.fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Daily Matches', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              const Text('Out of likes, premium filters, blocked chat and report user states.'),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      for (final user in users.take(5))
                        UserAvatarTile(
                          user: user,
                          trailing: FilledButton.tonal(
                            onPressed: () {},
                            child: const Text('Match'),
                          ),
                        ),
                      const SizedBox(height: 8),
                      MilanButton(label: 'Unlock Premium Filters', onTap: () {}),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
