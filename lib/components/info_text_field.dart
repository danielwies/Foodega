import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String text;
  final double textsize;
  final double textspacing;
  final Color color;

  InfoText({@required this.text, this.textsize, this.textspacing, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '$text',
              style: TextStyle(
                color: color,
                letterSpacing: textspacing,
                fontSize: textsize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
