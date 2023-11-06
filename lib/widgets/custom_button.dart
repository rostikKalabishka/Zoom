import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            minimumSize: Size(
                double.infinity, MediaQuery.of(context).size.height * 0.05),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            side: BorderSide(color: buttonColor)),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
