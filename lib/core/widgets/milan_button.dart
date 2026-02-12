import 'package:flutter/material.dart';

class MilanButton extends StatelessWidget {
  const MilanButton({
    super.key,
    required this.label,
    this.onTap,
    this.expanded = true,
  });

  final String label;
  final VoidCallback? onTap;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final button = DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEC5FA9), Color(0xFF6E3CEB)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        ),
        child: Text(label),
      ),
    );

    if (!expanded) return button;

    return SizedBox(width: double.infinity, child: button);
  }
}
