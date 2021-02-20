import 'package:flutter/material.dart';

class MeasureUnits extends StatelessWidget {
  final String unit;

  MeasureUnits({@required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: unit,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
