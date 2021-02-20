import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/components/meal_list_main_menu.dart';
import 'package:foodegaapp/components/circle.dart';
import 'package:foodegaapp/components/info_text_field.dart';
import 'package:foodegaapp/models/FoodData.dart';
import 'package:foodegaapp/models/FoodStore.dart';
import 'package:foodegaapp/models/ScreenToShow.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/UserBloc.dart';
import 'package:foodegaapp/screens/me_screen.dart';
import 'package:foodegaapp/screens/bmi_screen.dart';

class DiaryScreen extends StatefulWidget {
  final TabScreens screenToShow;

  const DiaryScreen({
    this.screenToShow = TabScreens.Diary,
  });

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<DiaryScreen> {
  int currentTabIndex = 0;
  List<FoodData> list = FoodStore.getList();
  int carbs = 0;
  int sugar = 0;
  int fat = 0;
  int protein = 0;

  @override
  void initState() {
    super.initState();
    currentTabIndex = this.widget.screenToShow.index;
  }

  @override
  Widget build(BuildContext context) {
    calculateNutrition(context);
    Widget circleShape = Container(
      width: MediaQuery.of(context).size.height / 5,
      height: MediaQuery.of(context).size.height / 5,
      child: CustomPaint(
        child: InfoText(
          text: BlocProvider.of<UserBloc>(context)
                  .getCalories()
                  .toStringAsFixed(0) +
              ' \n Calories',
          textsize: 30,
        ),
        painter: CirclePainter(),
      ),
    );

    Widget nutritionOverview = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('Max Sugar', style: TextStyle(color: Colors.white)),
              Text('$protein' + 'g', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Text('Max Carbs', style: TextStyle(color: Colors.white)),
              Text('$carbs' + 'g', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Text('Max Protein', style: TextStyle(color: Colors.white)),
              Text('$sugar' + 'g', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Text('Max Fat', style: TextStyle(color: Colors.white)),
              Text('$fat' + 'g', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );

    Widget mealDescription = Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height,
      child: MealListMainMenu(),
    );

    return Material(
      child: CupertinoTabScaffold(
        backgroundColor: Colors.black,
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.black,
          currentIndex: currentTabIndex,
          onTap: (int newIndex) => setState(() {
            currentTabIndex = newIndex;
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Diary'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'BMI'),
          ],
        ),
        tabBuilder: (context, i) {
          switch (i) {
            case 0:
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      circleShape,
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      nutritionOverview,
                      mealDescription,
                    ],
                  ),
                ),
              );
            case 1:
              return MeScreen();
            case 2:
              return BMICalculatorScreen();
            default:
              return DiaryScreen();
          }
        },
      ),
    );
  }

  calculateCalories(BuildContext context) {
    int age = BlocProvider.of<UserBloc>(context).userData.age;
    int weight = BlocProvider.of<UserBloc>(context).userData.weight;
    int height = BlocProvider.of<UserBloc>(context).userData.height;
    int calories = (67) + (14 * weight) + (5 * height) - (7 * age);
    BlocProvider.of<UserBloc>(context).setCalories(calories.toDouble());
    return calories;
  }

  calculateNutrition(BuildContext context) {
    int age = BlocProvider.of<UserBloc>(context).userData.age;
    int calories = calculateCalories(context);
    if (age <= 19) {
      carbs = (calories * (1 / 6)).toInt();
      sugar = (calories * (1 / 10)).toInt();
      fat = (calories * (1 / 25)).toInt();
      protein =
          (0.9 * BlocProvider.of<UserBloc>(context).userData.weight) as int;
    } else if (age >= 20 && age <= 59) {
      carbs = (calories * (1 / 6)).toInt();
      sugar = (calories * (1 / 8)).toInt();
      fat = (calories * (1 / 35)).toInt(); //35% der max Kalorien am Tag
      protein =
          (0.9 * BlocProvider.of<UserBloc>(context).userData.weight).toInt();
    } else {
      carbs = (calories * (1 / 5)).toInt();
      sugar = (calories * (1 / 7)).toInt();
      fat = (calories * (1 / 30)).toInt();
      protein =
          (0.9 * BlocProvider.of<UserBloc>(context).userData.weight).toInt();
    }

    BlocProvider.of<UserBloc>(context).setCarbs(carbs);
    BlocProvider.of<UserBloc>(context).setSugar(sugar);
    BlocProvider.of<UserBloc>(context).setFat(fat);
    BlocProvider.of<UserBloc>(context).setProtein(protein);
  }
}
