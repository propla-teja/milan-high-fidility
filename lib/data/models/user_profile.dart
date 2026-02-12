class UserProfile {
  const UserProfile({
    required this.id,
    required this.name,
    required this.tagline,
    required this.photoUrl,
    required this.blocked,
  });

  final String id;
  final String name;
  final String tagline;
  final String photoUrl;
  final bool blocked;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      photoUrl: json['photoUrl'] as String,
      blocked: json['blocked'] as bool,
    );
  }
}
