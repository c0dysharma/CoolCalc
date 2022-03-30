import 'package:flutter/material.dart';
import './key_design.dart';

class CalcButtons extends StatelessWidget {
  Function buttonPress;
  CalcButtons({required this.buttonPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                color: Colors.cyan,
                onPressed: buttonPress,
                text: 'AC',
              ),
              KeyDesign(
                color: Colors.cyan,
                onPressed: buttonPress,
                text: 'C',
              ),
              KeyDesign(
                color: Colors.cyan,
                onPressed: buttonPress,
                text: '<',
              ),
              KeyDesign(
                color: Colors.orange,
                onPressed: buttonPress,
                text: '/',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '7',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '8',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '9',
              ),
              KeyDesign(
                color: Colors.orange,
                onPressed: buttonPress,
                text: 'X',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '4',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '5',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '6',
              ),
              KeyDesign(
                color: Colors.orange,
                onPressed: buttonPress,
                text: '-',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '1',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '2',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '3',
              ),
              KeyDesign(
                color: Colors.orange,
                onPressed: buttonPress,
                text: '+',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '00',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '0',
              ),
              KeyDesign(
                color: Colors.black,
                onPressed: buttonPress,
                text: '.',
              ),
              KeyDesign(
                color: Colors.orange,
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
