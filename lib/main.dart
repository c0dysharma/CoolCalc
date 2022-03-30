import 'package:coolcalc/themes.dart';
import 'package:coolcalc/widgets/calc_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final bool _darkTheme = true;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoolCalc',
      home: MyHomePage(),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: _darkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _changeTheme() {}

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _extraHeight = _mediaQuery.padding.top;

    return Scaffold(
      // appBar: _appBar,
      body: SafeArea(
        child: CalcUI(
          mediaQuery: _mediaQuery,
          extraHeight: _extraHeight,
          themeToggle: _changeTheme,
        ),
      ),
    );
  }
}
