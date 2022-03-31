import 'package:coolcalc/themes.dart';
import 'package:coolcalc/widgets/calc_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CoolCalc',
          home: CalcUI(),
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          themeMode: ThemeMode.system,
        );
      }
    );
  }
}
