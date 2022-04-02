import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcFields extends StatefulWidget {
  const CalcFields({Key? key, 
    required this.history,
    required this.textToDisplay,
  }) : super(key: key);

  final String history;
  final String textToDisplay;

  @override
  State<CalcFields> createState() => _CalcFieldsState();
}

class _CalcFieldsState extends State<CalcFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.history,
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.textToDisplay,
              style: GoogleFonts.rubik(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
