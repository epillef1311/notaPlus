import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    required this.buttonText,
    required this.color,
    required this.onPressed,
    super.key,
  });

  final void Function()? onPressed;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(287, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
