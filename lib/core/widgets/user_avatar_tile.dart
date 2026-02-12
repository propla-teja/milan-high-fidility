import 'package:flutter/material.dart';

import '../../data/models/user_profile.dart';

class UserAvatarTile extends StatelessWidget {
  const UserAvatarTile({
    super.key,
    required this.user,
    this.trailing,
  });

  final UserProfile user;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(user.photoUrl),
      ),
      title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(user.tagline, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: trailing,
    );
  }
}
