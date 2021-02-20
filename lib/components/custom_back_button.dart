import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  CustomBackButton({@required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height / 20,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          RawMaterialButton(
            fillColor: Colors.black,
            child: Icon(
              Icons.arrow_back_ios_sharp,
              size: MediaQuery.of(context).size.height / 25,
            ),
            shape: CircleBorder(),
            onPressed: onPressed,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
