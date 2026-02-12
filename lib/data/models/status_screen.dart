import 'package:flutter/material.dart';

class StatusScreen {
  const StatusScreen({
    required this.id,
    required this.title,
    required this.description,
    required this.ctaLabel,
    required this.level,
    required this.icon,
  });

  final String id;
  final String title;
  final String description;
  final String ctaLabel;
  final String level;
  final IconData icon;

  factory StatusScreen.fromJson(Map<String, dynamic> json) {
    return StatusScreen(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      ctaLabel: json['ctaLabel'] as String,
      level: json['level'] as String,
      icon: _iconFromString(json['icon'] as String),
    );
  }

  static IconData _iconFromString(String iconName) {
    switch (iconName) {
      case 'verified_user':
        return Icons.verified_user_outlined;
      case 'report':
        return Icons.report_outlined;
      case 'timer_off':
        return Icons.timer_off_outlined;
      case 'lock':
        return Icons.lock_outline;
      case 'face':
        return Icons.face_retouching_natural_outlined;
      case 'payments':
        return Icons.payments_outlined;
      default:
        return Icons.info_outline;
    }
  }
}
