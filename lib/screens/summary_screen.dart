import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/animated_line.dart';
import 'package:foodegaapp/components/custom_back_button.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/components/rounded_forward_button.dart';
import 'package:foodegaapp/components/circle.dart';
import 'package:foodegaapp/screens/goals_screen.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreInit.dart';
import 'package:foodegaapp/services/UserBloc.dart';

int carbs = 0;
int sugar = 0;
int fat = 0;
int proteins = 0;

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget backbutton = Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: CustomBackButton(
          onPressed: () {
            Navigator.pop(context, GoalsScreen());
          },
          text: 'Goals Screen',
        ),
      ),
    );

    Widget textSection = Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoText(
            text: 'Thank you for answering our questions!',
          ),
          RichText(
            text: TextSpan(
              text: 'Your profile summary:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    Widget circleShape = Container(
      width: MediaQuery.of(context).size.height / 5,
      height: MediaQuery.of(context).size.height / 5,
      child: CustomPaint(
        child: InfoText(
          text: calculateCalories(context).toString() + '\n Calories',
          textsize: 25,
        ),
        painter: CirclePainter(),
      ),
    );

    Widget linesSection = Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.height / 3,
            height: MediaQuery.of(context).size.height / 60,
            child: AnimatedLine(
              enteredValue:
                  BlocProvider.of<UserBloc>(context).userData.age.toDouble() *
                      2,
            ),
          ),
          InfoText(
            text: 'Age: ' +
                BlocProvider.of<UserBloc>(context).userData.age.toString() +
                "years",
            textsize: 15,
            textspacing: 1.0,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Container(
            width: MediaQuery.of(context).size.height / 3,
            height: MediaQuery.of(context).size.height / 60,
            child: AnimatedLine(
              enteredValue:
                  BlocProvider.of<UserBloc>(context).userData.weight.toDouble(),
            ),
          ),
          InfoText(
            text: 'Weight: ' +
                BlocProvider.of<UserBloc>(context).userData.weight.toString() +
                "kg",
            textsize: 15,
            textspacing: 1.0,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Container(
            width: MediaQuery.of(context).size.height / 3,
            height: MediaQuery.of(context).size.height / 60,
            child: AnimatedLine(
              enteredValue:
                  BlocProvider.of<UserBloc>(context).userData.height.toDouble(),
            ),
          ),
          InfoText(
            text: 'Height: ' +
                BlocProvider.of<UserBloc>(context).userData.height.toString() +
                "cm",
            textsize: 15,
            textspacing: 1.0,
          ),
        ],
      ),
    );

    Widget goalsDisplay = Container(
      child: InfoText(
        text: 'Selected Goal: ' +
            BlocProvider.of<UserBloc>(context).userData.goal.toString(),
        textsize: 20,
      ),
    );

    Widget buttonSection = Container(
      height: MediaQuery.of(context).size.height / 6,
      alignment: Alignment.bottomCenter,
      child: RoundedForwardButton(
        onPressed: () {
          initializeDB();
          Navigator.pushNamed(context, 'mainmenu');
        },
      ),
    );

    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            backbutton,
            textSection,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            circleShape,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            linesSection,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            goalsDisplay,
            buttonSection
          ],
        ),
      ),
    );
  }

  calculateCalories(BuildContext context) {
    int age = BlocProvider.of<UserBloc>(context).userData.age;
    int weight = BlocProvider.of<UserBloc>(context).userData.weight;
    int height = BlocProvider.of<UserBloc>(context).userData.height;
    double calories = (67.0) + (14.0 * weight) + (5.0 * height) - (7.0 * age);
    BlocProvider.of<UserBloc>(context).setCalories(calories);
    return calories;
  }

  void initializeDB() {
    initProtein();
    initCalories();
    initSugar();
    initCarbs();
    initFat();
  }
}
