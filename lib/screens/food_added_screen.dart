import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/custom_back_button.dart';
import 'package:foodegaapp/models/FoodData.dart';
import 'package:foodegaapp/models/FoodStore.dart';
import 'package:foodegaapp/models/ScreenToShow.dart';
import 'package:foodegaapp/screens/diary_screen.dart';
import 'package:foodegaapp/services/CloudFirestoreSetter.dart';

List<FoodData> list = FoodStore.getList();

class FoodAddedScreen extends StatelessWidget {
  final List<FoodData> selectedItems;
  static int calories = 0;
  static int carbs = 0;
  static int sugar = 0;
  static int fat = 0;
  static int protein = 0;

  FoodAddedScreen({@required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    calories = list
        .reduce(
            (FoodData f1, FoodData f2) => FoodData()..kcal = f1.kcal + f2.kcal)
        .kcal;
    protein = list
        .reduce((FoodData f1, FoodData f2) =>
            FoodData()..protein = f1.protein + f2.protein)
        .protein;
    carbs = list
        .reduce((FoodData f1, FoodData f2) =>
            FoodData()..carbs = f1.carbs + f2.carbs)
        .carbs;

    sugar = list
        .reduce((FoodData f1, FoodData f2) =>
            FoodData()..sugar = f1.sugar + f2.sugar)
        .sugar;

    fat = list
        .reduce((FoodData f1, FoodData f2) => FoodData()..fat = f1.fat + f2.fat)
        .fat;

    Widget backbutton = Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: CustomBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'Add more food',
        ),
      ),
    );

    Widget textSection = Container(
      child: Text(
        'You added...',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );

    Widget buildFoodTile(FoodData data) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Row(
                  children: [
                    Text(
                      data.title + " - ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      data.kcal.toString() + "kcal - ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      data.description + " - ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      data.weight.toString() + "g",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget listView = Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(
        children: selectedItems.map((e) => buildFoodTile(e)).toList(),
      ),
    );

    Widget buttonSection = Container(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width * 0.12,
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        child: Text(
          'Add to Diary',
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
          setCalories();
          setCarbs();
          setFat();
          setProtein();
          setSugar();
          list.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DiaryScreen(screenToShow: TabScreens.Me)),
          );
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            listView,
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            buttonSection
          ],
        ),
      ),
    );
  }
}
