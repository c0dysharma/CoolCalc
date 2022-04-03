import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './themes/themes.dart';
import './calc_ui.dart';
import 'landscape_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      // For responsiveness
      return ScreenUtilInit(
        // For Get
        builder: () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CoolCalc',
          home: orientation == Orientation.portrait
              ? const CalcUI() // Acutal Calculator UI
              : const NoLandscapde(), // Just a place holder to mimic Landspace support
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          themeMode: ThemeMode.system,
        ),
        designSize: const Size(360, 640), // A reference to create Responsive-ness
      );
    });
  }
}
