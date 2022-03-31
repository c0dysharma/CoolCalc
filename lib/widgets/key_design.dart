import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
        style: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
        backgroundColor: Theme.of(context).highlightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
