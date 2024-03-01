
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 80, color: whiteColor,),
        Text(text, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),)
      ],
    );
  }
}