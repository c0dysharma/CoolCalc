import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalcThemeToggle extends StatelessWidget {
  // Vars to change icons based on current theme
  final Icon _lightOn = const Icon(Icons.wb_sunny);
  final Icon _lightOff = const Icon(Icons.wb_sunny_outlined);

  final Icon _darkOn = const Icon(Icons.nights_stay);
  final Icon _darkOff = const Icon(Icons.nights_stay_outlined);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            // Used GetX to change theme coz dunno how to do the "Default" way
            Get.changeThemeMode(ThemeMode.light);
          },
          icon: Get.isDarkMode ? _lightOff : _lightOn,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        SizedBox(
          width: 10.w, // .h and .w are from scrrenUtil to make responsive
        ),
        IconButton(
          onPressed: () {
            Get.changeThemeMode(ThemeMode.dark);
          },
          icon: Get.isDarkMode ? _darkOn : _darkOff,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
      ],
    );
  }
}
