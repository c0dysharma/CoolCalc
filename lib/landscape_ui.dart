import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class NoLandscapde extends StatelessWidget {
  const NoLandscapde({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).focusColor,
        child: Center(
          child: Text(
            "Rotate your device to calculate bruh..",
            style: GoogleFonts.montserrat(
              fontSize: 15.sp,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
