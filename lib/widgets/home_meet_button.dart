import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class HomeMeetButton extends StatelessWidget {
  const HomeMeetButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon});
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 4))
              ]),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Text(text)
      ]),
    );
  }
}
