import 'package:flutter/material.dart';

import '../../core/widgets/milan_button.dart';
import '../../core/widgets/user_avatar_tile.dart';
import '../../data/repositories/mock_milan_repository.dart';

class ModerationScreen extends StatelessWidget {
  const ModerationScreen({
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
          final blocked = users.where((u) => u.blocked).toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Safety & Moderation', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              const Text('Reusable moderation cards for block, report, unmatch and account controls.'),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Blocked Users', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      for (final user in blocked)
                        UserAvatarTile(
                          user: user,
                          trailing: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Unblock'),
                          ),
                        ),
                      const SizedBox(height: 10),
                      MilanButton(label: 'Contact Support', onTap: () {}),
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
