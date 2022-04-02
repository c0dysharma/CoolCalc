import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyDesign extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function onPressed;

  const KeyDesign(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(text),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        // padding: EdgeInsets.all(15.h),
        backgroundColor: Theme.of(context).highlightColor,
        fixedSize: Size(30.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
