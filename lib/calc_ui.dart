import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './widgets/calc_buttons.dart';
import './widgets/calc_field.dart';
import './widgets/calc_theme_toogle.dart';

class CalcUI extends StatefulWidget {
  const CalcUI({Key? key}) : super(key: key);

  @override
  State<CalcUI> createState() => _CalcUIState();
}

class _CalcUIState extends State<CalcUI> {
  double firstNum = 0;
  double secondNum = 0;
  String history = '';
  String res = '';
  String textToDispaly = '0';
  String operation = '';
  bool removeDecimal = false;

  void _buttonPress(String val) {
    if (val == 'AC') {
      firstNum = 0;
      secondNum = 0;
      history = '';
      res = '';
      operation = '';
    } else if (val == '+/-') {
      if (res.startsWith('-')) {
        res = res.substring(1);
      } else {
        res = '-' + res;
      }
    } else if (val == '<') {
      if (textToDispaly.startsWith('-') && textToDispaly.length == 2) {
        res = '';
      } else {
        res = textToDispaly.substring(0, textToDispaly.length - 1);
      }
      removeDecimal = false;
    } else if (val == '/' || val == 'X' || val == '-' || val == '+') {
      if (firstNum != 0) {
        if (val == '+') {
          firstNum = firstNum + double.parse(textToDispaly);
        }
        if (val == '-') {
          firstNum = firstNum - double.parse(textToDispaly);
        }
        if (val == 'X') {
          firstNum = firstNum * double.parse(textToDispaly);
        }
        if (val == '/') {
          firstNum = firstNum / double.parse(textToDispaly);
        }
      } else {
        firstNum = (double.parse(textToDispaly));
      }
      res = '';

      if (history.isEmpty) {
        history = firstNum.toString() + history + ' ' + val;
      } else {
        history = firstNum.toString() + ' ' + val;
      }
      operation = val;
    } else if (val == '=') {
      secondNum = double.parse(textToDispaly);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history = firstNum.toString() +
            ' ' +
            operation.toString() +
            ' ' +
            secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history = firstNum.toString() +
            ' ' +
            operation.toString() +
            ' ' +
            secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history = firstNum.toString() +
            ' ' +
            operation.toString() +
            ' ' +
            secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() +
            ' ' +
            operation.toString() +
            ' ' +
            secondNum.toString();
      }
      firstNum = 0;
      secondNum = 0;
      removeDecimal = true;
    } else if (val == '.') {
      res = textToDispaly + '.';
      removeDecimal = false;
    } else {
      if (textToDispaly.isNotEmpty && textToDispaly.contains('.')) {
        res = double.parse(textToDispaly + val).toString();
      } else {
        res = int.parse(textToDispaly + val).toString();
        removeDecimal = true;
      }
    }

    setState(() {
      if (res.isNotEmpty && removeDecimal) {
        res = double.parse(res).toStringAsFixed(3);
      }
      if (res.endsWith('.000') && removeDecimal) {
        textToDispaly = res.split('.')[0];
      } else {
        textToDispaly = res;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final extraHeight = mediaQuery.padding.top;
    final uiHeight = (mediaQuery.size.height - extraHeight);
    final uiWidth = mediaQuery.size.width;
    final darkModeColors = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Theme.of(context).focusColor,
      statusBarColor: Theme.of(context).canvasColor,
    );
    final lightModeColors = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Theme.of(context).focusColor,
      statusBarColor: Theme.of(context).canvasColor,
    );

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Get.isDarkMode ? darkModeColors : lightModeColors,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: uiHeight * 0.03),
              Container(
                width: uiWidth * 0.4,
                height: uiHeight * 0.07,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).focusColor,
                ),
                child: CalcThemeToggle(uiWidth: uiWidth),
              ),
              SizedBox(
                height: uiHeight * 0.3,
                width: mediaQuery.size.width,
                child: CalcFields(
                  history: history,
                  textToDisplay: textToDispaly,
                ),
              ),
              SizedBox(
                height: uiHeight * 0.6,
                child: CalcButtons(
                  buttonPress: _buttonPress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
