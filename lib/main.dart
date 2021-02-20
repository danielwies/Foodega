import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/screens/age_screen.dart';
import 'package:foodegaapp/screens/diary_screen.dart';
import 'package:foodegaapp/screens/food_added_screen.dart';
import 'package:foodegaapp/screens/login_screen.dart';
import 'package:foodegaapp/screens/profile_summary_screen.dart';
import 'package:foodegaapp/screens/register_screen.dart';
import 'package:foodegaapp/screens/bmi_screen.dart';
import 'package:foodegaapp/screens/gender_screen.dart';
import 'package:foodegaapp/screens/goals_screen.dart';
import 'package:foodegaapp/screens/height_screen.dart';
import 'package:foodegaapp/screens/mealdetails_screen.dart';
import 'package:foodegaapp/screens/me_screen.dart';
import 'package:foodegaapp/screens/start_screen.dart';
import 'package:foodegaapp/screens/summary_screen.dart';
import 'package:foodegaapp/screens/update_bmi_screen.dart';
import 'package:foodegaapp/screens/weight_screen.dart';
import 'package:foodegaapp/services/BlocProvider.dart';
import 'package:foodegaapp/services/UserBloc.dart';
import 'models/UserData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Foodega());
}

class Foodega extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      bloc: UserBloc(UserData()),
      child: MaterialApp(
        title: 'Foodega',
        home: StartScreen(),
        initialRoute: '/',
        routes: {
          'loginscreen': (context) => LoginScreen(),
          'registerscreen': (context) => RegisterScreen(),
          'startscreen': (context) => StartScreen(),
          'agescreen': (context) => AgeScreen(),
          'weightscreen': (context) => WeightScreen(),
          'heightscreen': (context) => HeightScreen(),
          'genderscreen': (context) => GenderScreen(),
          'goalsscreen': (context) => GoalsScreen(),
          'profilesummaryscreen': (context) => ProfileSummaryScreen(),
          'summaryscreen': (context) => SummaryScreen(),
          'mainmenu': (context) => DiaryScreen(),
          'mealdetails': (context) => MealDetailsScreen(child: null),
          'foodaddedscreen': (context) => FoodAddedScreen(selectedItems: null),
          'mescreen': (context) => MeScreen(),
          'bmiscreen': (context) => BMICalculatorScreen(),
          'bmiupdatescreen': (context) => BMIUpdateScreen(),
        },
      ),
    );
  }
}
