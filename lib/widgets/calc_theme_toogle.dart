import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalcThemeToggle extends StatelessWidget {
  CalcThemeToggle({
    required this.uiWidth,
  });

  final double uiWidth;
  Icon lightOn = const Icon(Icons.wb_sunny);
  Icon lightOff = const Icon(Icons.wb_sunny_outlined);

  Icon darkOn = const Icon(Icons.nights_stay);
  Icon darkOff = const Icon(Icons.nights_stay_outlined);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Get.changeThemeMode(ThemeMode.light);
          },
          icon: Get.isDarkMode ? lightOff : lightOn,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        SizedBox(
          width: uiWidth * 0.05,
        ),
        IconButton(
          onPressed: () {
            Get.changeThemeMode(ThemeMode.dark);
          },
          icon: Get.isDarkMode ? darkOn : darkOff,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
      ],
    );
  }
}
