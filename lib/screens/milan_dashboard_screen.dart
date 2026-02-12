import 'package:flutter/material.dart';

import '../data/mock_repository.dart';
import '../models/screen_section.dart';
import '../widgets/screen_card.dart';

class MilanDashboardScreen extends StatefulWidget {
  const MilanDashboardScreen({super.key});

  @override
  State<MilanDashboardScreen> createState() => _MilanDashboardScreenState();
}

class _MilanDashboardScreenState extends State<MilanDashboardScreen> {
  final _repository = const MockRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Milan Professionals UI Kit'),
        centerTitle: false,
      ),
      body: FutureBuilder<List<ScreenSection>>(
        future: _repository.loadSections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Failed to load mock data.'),
            );
          }

          final sections = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: sections.length,
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final section = sections[index];
              return _SectionBlock(section: section);
            },
          );
        },
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.section});

  final ScreenSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          section.subtitle,
          style: TextStyle(color: Colors.grey.shade700),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 255,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: section.items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = section.items[index];
              return SizedBox(width: 290, child: ScreenCard(item: item));
            },
          ),
        ),
      ],
    );
  }
}
