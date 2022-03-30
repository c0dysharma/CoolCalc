import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyDesign extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function onPressed;

  KeyDesign(
      {required this.text, required this.textColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(text),
      child: Text(
        text,
        style: GoogleFonts.rubik(
          color: textColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: Theme.of(context).highlightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
