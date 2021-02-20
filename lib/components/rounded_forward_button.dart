import 'package:flutter/material.dart';

class RoundedForwardButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  RoundedForwardButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 6,
      child: RawMaterialButton(
        fillColor: Colors.white,
        child: Icon(
          Icons.arrow_forward_ios,
          size: MediaQuery.of(context).size.height / 25,
        ),
        shape: CircleBorder(),
        onPressed: onPressed,
      ),
    );
  }
}
