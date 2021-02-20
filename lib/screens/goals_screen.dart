import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/custom_back_button.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/components/rounded_text_button.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreSetter.dart';
import 'package:foodegaapp/services/UserBloc.dart';
import 'package:foodegaapp/screens/gender_screen.dart';

// ignore: must_be_immutable
class GoalsScreen extends StatelessWidget {
  String _goal;

  void _onPressed(String goal) {
    _goal = goal;
  }

  @override
  Widget build(BuildContext context) {
    Widget backbutton = Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: CustomBackButton(
          onPressed: () {
            Navigator.pop(context, GenderScreen());
          },
          text: 'Gender Screen',
        ),
      ),
    );

    Widget textSection = Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoText(
            text: 'Almost there... \n One last question...',
          ),
          RichText(
            text: TextSpan(
              text: 'Do you want to ...?',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );

    Widget goalsPicker = Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
        child: Column(
          children: [
            RoundedTextButton(
              onPressed: () {
                _onPressed('Lose Weight');
                BlocProvider.of<UserBloc>(context).setGoal(_goal);
                setGoal(context);
                Navigator.pushNamed(context, 'summaryscreen');
              },
              text: 'Lose Weight',
            ),
            SizedBox(height: 20),
            RoundedTextButton(
              onPressed: () {
                _onPressed('Gain Weight');
                BlocProvider.of<UserBloc>(context).setGoal(_goal);
                setGoal(context);
                Navigator.pushNamed(context, 'summaryscreen');
              },
              text: 'Gain Weight',
            ),
            SizedBox(height: 20),
            RoundedTextButton(
              onPressed: () {
                _onPressed('Maintain Weight');
                BlocProvider.of<UserBloc>(context).setGoal(_goal);
                setGoal(context);
                Navigator.pushNamed(context, 'summaryscreen');
              },
              text: 'Maintain Weight',
            ),
          ],
        ),
      ),
    );

    return CupertinoApp(
      home: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            backbutton,
            textSection,
            goalsPicker,
          ],
        ),
      ),
    );
  }
}
