import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/custom_back_button.dart';
import 'package:foodegaapp/components/slider_button.dart';
import 'package:foodegaapp/models/ScreenToShow.dart';
import 'package:foodegaapp/screens/diary_screen.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreSetter.dart';
import 'package:foodegaapp/services/UserBloc.dart';

double height = 0.0;
int weight = 0;
double bmi = 0;

class BMIUpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget backbutton = Container(
      height: MediaQuery.of(context).size.height / 6,
      child: CustomBackButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DiaryScreen(screenToShow: TabScreens.Bmi),
            ),
          );
        },
        text: 'BMI Overview',
      ),
    );

    height =
        BlocProvider.of<UserBloc>(context).userData.height.toDouble() / 100;
    weight = BlocProvider.of<UserBloc>(context).userData.weight;
    bmi = weight / (height * height);

    Widget text = Container(
      height: MediaQuery.of(context).size.height / 8,
      child: Text(
        'Update data to calculate your BMI',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );

    Widget sliderSection = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SliderButton(
              onValueChanged: (double newVal) =>
                  BlocProvider.of<UserBloc>(context).setWeight(newVal.toInt()),
            ),
          ],
        ),
      ),
    );

    Widget buttonSection = Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Column(
        children: [
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Text(
              'Calculate BMI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.blue),
            ),
            onPressed: () {
              setWeight(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DiaryScreen(screenToShow: TabScreens.Bmi)),
              );
            },
          ),
        ],
      ),
    );

    return CupertinoApp(
      home: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            backbutton,
            text,
            sliderSection,
            buttonSection
          ],
        ),
      ),
    );
  }
}
