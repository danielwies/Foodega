import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final int range;
  final int initialValue;
  final Function(int newValue) onValueChanged;

  NumberPicker({this.range, this.initialValue, this.onValueChanged});

  @override
  _NumberPicker createState() => _NumberPicker();
}

class _NumberPicker extends State<NumberPicker> {
  FixedExtentScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController =
        FixedExtentScrollController(initialItem: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPicker(
        itemExtent: 35,
        scrollController: scrollController,
        onSelectedItemChanged: (int value) {
          this.widget.onValueChanged?.call(value);
        },
        children: List<Widget>.generate(
          widget.range,
          (int index) {
            return Center(
              child: Text(
                (index++).toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
