import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final Function(double newValue) onValueChanged;

  SliderButton({this.onValueChanged});

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double _currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CupertinoSlider(
                value: _currentValue,
                min: 0,
                max: 250,
                divisions: 250,
                onChanged: (double value) {
                  setState(
                    () {
                      _currentValue = value;
                    },
                  );
                  this.widget.onValueChanged?.call(value);
                },
              ),
            ),
          ],
        ),
        Text(
          'Your current weight: ${_currentValue.toString()}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
