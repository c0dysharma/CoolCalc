import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoLandscapde extends StatelessWidget {
  const NoLandscapde({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Created these for easy statusbar and navbar color change
    final darkModeColors = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Theme.of(context).canvasColor,
      statusBarColor: Theme.of(context).canvasColor,
    );
    final lightModeColors = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Theme.of(context).canvasColor,
      statusBarColor: Theme.of(context).canvasColor,
    );
    return Scaffold(
      // Used to change nav and statusbar color
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Get.isDarkMode ? darkModeColors : lightModeColors,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).canvasColor,
          child: Center(
            child: Text(
              "Rotate your device to calculate bruh..",
              style: GoogleFonts.montserrat(
                fontSize: 10.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
