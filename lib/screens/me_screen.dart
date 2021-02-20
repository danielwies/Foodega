import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/circle.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/components/nutrition_circle.dart';
import 'package:foodegaapp/models/FoodData.dart';
import 'package:foodegaapp/models/FoodStore.dart';
import 'package:foodegaapp/screens/profile_summary_screen.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/CloudFirestoreGetter.dart';
import 'package:foodegaapp/services/CloudFirestoreResetter.dart';
import 'package:foodegaapp/services/UserBloc.dart';

List<FoodData> list = FoodStore.getList();

class MeScreen extends StatefulWidget {
  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  int _curCalories = 0;
  int _curProtein = 0;
  int _curCarbs = 0;
  int _curFat = 0;
  int _curSugar = 0;

  @override
  Widget build(BuildContext context) {
    Widget profileroute = Container(
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.7),
        child: CustomPaint(
          painter: CirclePainter(),
          child: IconButton(
            icon: Image.asset(
              './assets/images/rickroll.gif',
              scale: 0.5,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSummaryScreen()),
              );
            },
          ),
        ),
      ),
    );

    Widget circleSection = FutureBuilder(
      future: Future.wait([
        getUserCalories(),
        getUserProtein(),
        getUserCarbs(),
        getUserSugar(),
        getUserFat()
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          _curCalories = snapshot.data[0];
          _curProtein = snapshot.data[1];
          _curCarbs = snapshot.data[2];
          _curSugar = snapshot.data[3];
          _curFat = snapshot.data[4];
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.height / 4,
                  height: MediaQuery.of(context).size.height / 4,
                  child: CustomPaint(
                    child: InfoText(
                      text: _curCalories.toString() + "\n Calories",
                      textsize: 30,
                    ),
                    painter: CirclePainter(),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NutritionCircle(
                      text: 'Sugar',
                      nutritionvalue: _curProtein == 0 ? 0 : _curProtein,
                      maxValue: BlocProvider.of<UserBloc>(context).getProtein(),
                    ),
                    NutritionCircle(
                      text: 'Carbs',
                      nutritionvalue: _curCarbs == 0 ? 0 : _curCarbs,
                      maxValue: BlocProvider.of<UserBloc>(context).getCarbs(),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NutritionCircle(
                      text: 'Protein',
                      nutritionvalue: _curSugar == 0 ? 0 : _curSugar,
                      maxValue: BlocProvider.of<UserBloc>(context).getSugar(),
                    ),
                    NutritionCircle(
                      text: 'Fat',
                      nutritionvalue: _curFat == 0 ? 0 : _curFat,
                      maxValue: BlocProvider.of<UserBloc>(context).getFat(),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return InfoText(text: 'No Data to display');
      },
    );

    Widget resetButton = Container(
      height: MediaQuery.of(context).size.height * 0.06,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 8,
        child: Text(
          'Reset Values',
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
          resetData();
        },
      ),
    );

    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              profileroute,
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              circleSection,
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              resetButton
            ],
          ),
        ),
      ),
    );
  }

  void resetData() {
    setState(() {
      resetCalories();
      resetProtein();
      resetFat();
      resetSugar();
      resetCarbs();
    });
  }
}
