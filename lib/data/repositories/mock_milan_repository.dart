import '../models/status_screen.dart';
import '../models/user_profile.dart';
import '../services/mock_json_service.dart';

class MockMilanRepository {
  const MockMilanRepository({required this.service});

  final MockJsonService service;

  Future<List<StatusScreen>> fetchScreens() async {
    final records = await service.loadCollection('screens', 'assets/mock/screens.json');
    return records
        .map((e) => StatusScreen.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<UserProfile>> fetchUsers() async {
    final records = await service.loadCollection('users', 'assets/mock/users.json');
    return records
        .map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
