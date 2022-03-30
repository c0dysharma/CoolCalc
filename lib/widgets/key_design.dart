import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyDesign extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  KeyDesign({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>onPressed(text),
      child: Text(
        text,
        style: GoogleFonts.rubik(
          color: color,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: Theme.of(context).focusColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
