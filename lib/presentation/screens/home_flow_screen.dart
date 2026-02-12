import 'package:flutter/material.dart';

import '../../core/widgets/milan_button.dart';
import '../../core/widgets/status_card.dart';
import '../../data/repositories/mock_milan_repository.dart';

class HomeFlowScreen extends StatelessWidget {
  const HomeFlowScreen({
    super.key,
    required this.repository,
  });

  final MockMilanRepository repository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: repository.fetchScreens(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!.where((e) => e.id.contains('onboarding') || e.id.contains('otp') || e.id.contains('verification')).toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Milan Onboarding & Verification', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              const Text('Reusable flow built from mock data to mirror the uploaded wireframes.'),
              const SizedBox(height: 16),
              const _WelcomeHero(),
              const SizedBox(height: 16),
              ...items.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: StatusCard(item: item),
                  )),
            ],
          );
        },
      ),
    );
  }
}

class _WelcomeHero extends StatelessWidget {
  const _WelcomeHero();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Onboarding & Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text('OTP, expiry, temporary lock, and verification states are connected to mock JSON states.'),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter mobile number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            MilanButton(label: 'Continue with OTP', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
