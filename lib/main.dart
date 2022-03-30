import 'package:coolcalc/widgets/calc_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoolCalc',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        focusColor: const Color(0xfff7f7f7),
        errorColor: Colors.red,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar();
    final _mediaQuery = MediaQuery.of(context);
    final _extraHeight = _mediaQuery.padding.top + _appBar.preferredSize.height;

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: CalcUI(
          mediaQuery: _mediaQuery,
          extraHeight: _extraHeight,
        ),
      ),
    );
  }
}
