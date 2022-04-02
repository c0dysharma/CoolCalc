import 'package:coolcalc/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './key_design.dart';

class CalcButtons extends StatelessWidget {
  final Function buttonPress;
  const CalcButtons({Key? key, required this.buttonPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                textColor: MyTheme.topColoumnCyan,
                onPressed: buttonPress,
                text: 'AC',
              ),
              KeyDesign(
                textColor: MyTheme.topColoumnCyan,
                onPressed: buttonPress,
                text: '+/-',
              ),
              KeyDesign(
                textColor: MyTheme.topColoumnCyan,
                onPressed: buttonPress,
                text: '<',
              ),
              KeyDesign(
                textColor: MyTheme.rightRowOrange,
                onPressed: buttonPress,
                text: '/',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '7',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '8',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '9',
              ),
              KeyDesign(
                textColor: MyTheme.rightRowOrange,
                onPressed: buttonPress,
                text: 'X',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '4',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '5',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '6',
              ),
              KeyDesign(
                textColor: MyTheme.rightRowOrange,
                onPressed: buttonPress,
                text: '-',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '1',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '2',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '3',
              ),
              KeyDesign(
                textColor: MyTheme.rightRowOrange,
                onPressed: buttonPress,
                text: '+',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '00',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '0',
              ),
              KeyDesign(
                textColor: Theme.of(context).primaryColor,
                onPressed: buttonPress,
                text: '.',
              ),
              KeyDesign(
                textColor: MyTheme.rightRowOrange,
                onPressed: buttonPress,
                text: '=',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
