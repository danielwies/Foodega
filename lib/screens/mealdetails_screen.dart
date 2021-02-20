import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/custom_back_button.dart';
import 'package:foodegaapp/models/MealChoices.dart';

class MealDetailsScreen extends StatelessWidget {
  final Widget child;
  final MealChoices choice;

  MealDetailsScreen({this.choice, @required this.child});

  @override
  Widget build(BuildContext context) {
    Widget backButton = Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: CustomBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: "               ${choice.choice}",
        ),
      ),
    );

    Widget mealDetails = Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.8,
      child: child,
    );

    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: Center(
          child: Column(
            children: [
              backButton,
              mealDetails,
            ],
          ),
        ),
      ),
    );
  }
}
