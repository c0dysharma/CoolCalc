import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalcFields extends StatefulWidget {
  const CalcFields({
    Key? key,
    required this.history,
    required this.textToDisplay,
  }) : super(key: key);

  final String history;
  final String textToDisplay;

  @override
  State<CalcFields> createState() => _CalcFieldsState();
}

class _CalcFieldsState extends State<CalcFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          20.h), // .h and .w are from scrrenUtil to make responsive
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.history,
            style: GoogleFonts.rubik(
              fontSize: 15.sp, // .sp  is from scrrenUtil to make responsive
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 4.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.textToDisplay,
              style: GoogleFonts.rubik(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
