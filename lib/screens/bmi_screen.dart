import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/animated_line.dart';
import 'package:foodegaapp/components/circle.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/screens/update_bmi_screen.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreGetter.dart';
import 'package:foodegaapp/services/UserBloc.dart';

double height = 0.0;
int weight = 0;
double bmi = 0;

class BMICalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    height =
        BlocProvider.of<UserBloc>(context).userData.height.toDouble() / 100;
    weight = BlocProvider.of<UserBloc>(context).userData.weight;
    bmi = weight / (height * height);

    Widget circleShape = Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4,
      child: CustomPaint(
        child: InfoText(
          text: bmi.toStringAsFixed(2) + ' \nBMI',
          textsize: 30,
        ),
        painter: CirclePainter(),
      ),
    );

    Widget text = Container(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(
        'BMI: ' + getClassification(context),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );

    Widget buttonSection = Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Text(
              'Update BMI',
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIUpdateScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );

    Widget linesSection = FutureBuilder(
      future: Future.wait([getUserWeight(), getUserHeight()]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.height / 3,
                  height: MediaQuery.of(context).size.height / 60,
                  child: AnimatedLine(
                    enteredValue: BlocProvider.of<UserBloc>(context)
                        .userData
                        .weight
                        .toDouble(),
                  ),
                ),
                InfoText(
                  text: 'Weight: ' + snapshot.data[0].toString() + 'kg',
                  textsize: 15,
                  textspacing: 1.0,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  width: MediaQuery.of(context).size.height / 3,
                  height: MediaQuery.of(context).size.height / 60,
                  child: AnimatedLine(
                    enteredValue: BlocProvider.of<UserBloc>(context)
                        .userData
                        .height
                        .toDouble(),
                  ),
                ),
                InfoText(
                  text: 'Height: ' + snapshot.data[1].toString() + 'cm',
                  textsize: 15,
                  textspacing: 1.0,
                ),
              ],
            ),
          );
        }
        return InfoText(text: 'No Data to display');
      },
    );

    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [circleShape, text, linesSection, buttonSection],
          ),
        ),
      ),
    );
  }

  getClassification(context) {
    String msg = "";
    if (bmi < 17) {
      msg = "Underweight";
    } else if (bmi < 18.5) {
      msg = "Slightly underweight";
    } else if (bmi < 25) {
      msg = "Healthy weight";
    } else if (bmi < 30) {
      msg = "Overweight";
    } else if (bmi >= 30) {
      msg = "Obesity";
    }
    return msg;
  }
}
