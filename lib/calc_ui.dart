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
  // Vars to support Calculator functionaliy
  double _firstNum = 0;
  double _secondNum = 0;
  String _res = '';
  String _operation = '';
  bool _removeDecimal = false;
  // No private
  String history = '';
  String textToDispaly = '0';

  // Calculator Brain
  void _buttonPress(String val) {
    if (val == 'AC') {
      _firstNum = 0;
      _secondNum = 0;
      history = '';
      _res = '';
      _operation = '';
    } else if (val == '+/-') {
      if (_res.startsWith('-')) {
        _res = _res.substring(1);
      } else {
        _res = '-' + _res;
      }
    } else if (val == '<') {
      if (textToDispaly.startsWith('-') && textToDispaly.length == 2) {
        _res = '';
      } else {
        _res = textToDispaly.substring(0, textToDispaly.length - 1);
      }
      _removeDecimal = false;
    } else if (val == '/' || val == 'X' || val == '-' || val == '+') {
      if (_firstNum != 0) {
        if (val == '+') {
          _firstNum = _firstNum + double.parse(textToDispaly);
        }
        if (val == '-') {
          _firstNum = _firstNum - double.parse(textToDispaly);
        }
        if (val == 'X') {
          _firstNum = _firstNum * double.parse(textToDispaly);
        }
        if (val == '/') {
          _firstNum = _firstNum / double.parse(textToDispaly);
        }
      } else {
        _firstNum = (double.parse(textToDispaly));
      }
      _res = '';

      if (history.isEmpty) {
        history = _firstNum.toString() + history + ' ' + val;
      } else {
        history = _firstNum.toString() + ' ' + val;
      }
      _operation = val;
    } else if (val == '=') {
      _secondNum = double.parse(textToDispaly);
      if (_operation == '+') {
        _res = (_firstNum + _secondNum).toString();
        history = _firstNum.toString() +
            ' ' +
            _operation.toString() +
            ' ' +
            _secondNum.toString();
      }
      if (_operation == '-') {
        _res = (_firstNum - _secondNum).toString();
        history = _firstNum.toString() +
            ' ' +
            _operation.toString() +
            ' ' +
            _secondNum.toString();
      }
      if (_operation == 'X') {
        _res = (_firstNum * _secondNum).toString();
        history = _firstNum.toString() +
            ' ' +
            _operation.toString() +
            ' ' +
            _secondNum.toString();
      }
      if (_operation == '/') {
        _res = (_firstNum / _secondNum).toString();
        history = _firstNum.toString() +
            ' ' +
            _operation.toString() +
            ' ' +
            _secondNum.toString();
      }
      _firstNum = 0;
      _secondNum = 0;
      _removeDecimal = true;
    } else if (val == '.') {
      _res = textToDispaly + '.';
      _removeDecimal = false;
    } else {
      if (textToDispaly.isNotEmpty && textToDispaly.contains('.')) {
        _res = double.parse(textToDispaly + val).toString();
      } else {
        _res = int.parse(textToDispaly + val).toString();
        _removeDecimal = true;
      }
    }

    setState(() {
      if (_res.isNotEmpty && _removeDecimal) {
        _res = double.parse(_res).toStringAsFixed(3);
      }
      if (_res.endsWith('.000') && _removeDecimal) {
        textToDispaly = _res.split('.')[0];
      } else {
        textToDispaly = _res;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Vars to divide UI in percentage
    final _mediaQuery = MediaQuery.of(context);
    final _extraHeight = _mediaQuery.padding.top;
    final _uiHeight = (_mediaQuery.size.height - _extraHeight);
    final _uiWidth = _mediaQuery.size.width;
    // Created these for easy statusbar and navbar color change
    final _darkModeColors = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Theme.of(context).focusColor,
      statusBarColor: Theme.of(context).canvasColor,
    );
    final _lightModeColors = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Theme.of(context).focusColor,
      statusBarColor: Theme.of(context).canvasColor,
    );

    return Scaffold(
      // Used to change nav and statusbar color
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Get.isDarkMode ? _darkModeColors : _lightModeColors,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: _uiHeight * 0.03), // 3% height space above
              Container(
                width: _uiWidth * 0.4,
                height: _uiHeight *
                    0.07, // takes 7% height for Theme Toggle switches
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).focusColor,
                ),
                child: CalcThemeToggle(),
              ),
              SizedBox(
                height: _uiHeight *
                    0.3, // takes 30% height of the fields of history and result
                width: _mediaQuery.size.width,
                child: CalcFields(
                  history: history,
                  textToDisplay: textToDispaly,
                ),
              ),
              SizedBox(
                height: _uiHeight * 0.6, // rest 60% taken by actual buttons
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
