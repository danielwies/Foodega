import 'package:flutter/material.dart';
import 'package:foodegaapp/components/circle.dart';
import 'package:foodegaapp/components/info_text_field.dart';

class NutritionCircle extends StatelessWidget {
  final String text;
  final int maxValue;
  final int nutritionvalue;

  const NutritionCircle(
      {@required this.text,
      @required this.maxValue,
      @required this.nutritionvalue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 8.5,
      child: CustomPaint(
        child: InfoText(
          text: text +
              '\n' +
              nutritionvalue.toString() +
              '/' +
              maxValue.toString(),
        ),
        painter: CirclePainter(),
      ),
    );
  }
}
