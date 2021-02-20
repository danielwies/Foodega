import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  RoundedTextButton({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        fillColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 2,
            color: Colors.blue,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
