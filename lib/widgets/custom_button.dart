import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color color;
  final IconData icon;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.color = Colors.indigo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(texto, style: const TextStyle(fontSize: 16)),
    );
  }
}
