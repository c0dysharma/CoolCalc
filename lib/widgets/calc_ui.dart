import 'package:flutter/material.dart';

import './calc_buttons.dart';
import 'calc_field.dart';

class CalcUI extends StatefulWidget {
  final double extraHeight;
  final MediaQueryData mediaQuery;
  final Function themeToggle;

  CalcUI({
    required this.extraHeight,
    required this.mediaQuery,
    required this.themeToggle,
  });

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

  void _buttonPress(String val) {
    if (val == 'AC') {
      firstNum = 0;
      secondNum = 0;
      history = '';
      res = '';
      operation = '';
    } else if (val == 'C') {
      firstNum = 0;
      secondNum = 0;
      res = '';
      operation = '';
    } else if (val == '<') {
      res = textToDispaly.substring(0, textToDispaly.length - 1);
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
        history = firstNum.toString() + history + val;
      } else {
        history = firstNum.toString() + val;
      }
      operation = val;
    } else if (val == '=') {
      secondNum = double.parse(textToDispaly);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else if (val == '.') {
      res = textToDispaly + '.';
    } else {
      if (textToDispaly.isNotEmpty &&
          textToDispaly.substring(textToDispaly.length - 1) == '.') {
        res = double.parse(textToDispaly + val).toString();
      } else {
        res = int.parse(textToDispaly + val).toString();
      }
    }

    setState(() {
      if (res.endsWith('.0')) {
        textToDispaly = res.split('.')[0];
      } else {
        textToDispaly = res;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiHeight = (widget.mediaQuery.size.height - widget.extraHeight);
    return Column(
      children: [
        SizedBox(height: uiHeight * 0.05),
        Container(
          height: uiHeight * 0.05,
          child: ElevatedButton(
            onPressed: widget.themeToggle(),
            child: const Icon(Icons.bolt),
          ),
        ),
        SizedBox(
          height: uiHeight * 0.3,
          width: widget.mediaQuery.size.width,
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
    );
  }
}
