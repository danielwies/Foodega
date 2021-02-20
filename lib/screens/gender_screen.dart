import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/custom_back_button.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/components/rounded_text_button.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreSetter.dart';
import 'package:foodegaapp/services/UserBloc.dart';
import 'package:foodegaapp/screens/start_screen.dart';

// ignore: must_be_immutable
class GenderScreen extends StatelessWidget {
  String _gender;

  void _onPressed(String gender) {
    _gender = gender;
  }

  @override
  Widget build(BuildContext context) {
    Widget backbutton = Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: CustomBackButton(
          onPressed: () {
            Navigator.pop(context, StartScreen());
          },
          text: 'Height Screen',
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
            text:
                'To gather some data about you please \n answer the following question.',
            textsize: 15,
          ),
          RichText(
            text: TextSpan(
              text: 'What gender are you?',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );

    Widget genderPicker = Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/images/male-gender.png', scale: 0.77),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                RoundedTextButton(
                  text: 'Male',
                  onPressed: () {
                    _onPressed('Male');
                    BlocProvider.of<UserBloc>(context).setGender(_gender);
                    setGender(context);
                    Navigator.pushNamed(context, 'goalsscreen');
                  },
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/images/female-gender.png'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                RoundedTextButton(
                  text: 'Female',
                  onPressed: () {
                    _onPressed('Female');
                    BlocProvider.of<UserBloc>(context).setGender(_gender);
                    setGender(context);
                    Navigator.pushNamed(context, 'goalsscreen');
                  },
                ),
              ],
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
            genderPicker,
          ],
        ),
      ),
    );
  }
}
