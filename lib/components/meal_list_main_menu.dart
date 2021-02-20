import 'package:flutter/material.dart';
import 'package:foodegaapp/components/meal_details.dart';
import 'package:foodegaapp/models/MealChoices.dart';
import 'package:foodegaapp/screens/mealdetails_screen.dart';

class MealListMainMenu extends StatelessWidget {
  final List<MealChoices> mealchoices = [
    MealChoices(
        icon: 'breakfast.png',
        choice: 'Breakfast',
        description: '700 - 1000kcal'),
    MealChoices(
        icon: 'lunch.png', choice: 'Lunch', description: '900 - 1300kcal'),
    MealChoices(icon: 'snack.png', choice: 'Snack', description: '~ 200kcal'),
    MealChoices(
        icon: 'dinner.png', choice: 'Dinner', description: '1000 - 1500kcal'),
  ];

  final List<String> meals = ['breakfast', 'lunch', 'snack', 'dinner'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: mealchoices.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[800],
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Image(
                height: 45,
                width: 45,
                image: AssetImage('assets/images/${mealchoices[index].icon}'),
              ),
              title: Text(
                mealchoices[index].choice,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                mealchoices[index].description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.add,
                color: Colors.white,
                size: MediaQuery.of(context).size.height / 25,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(
                        choice: mealchoices[index],
                        child: MealDetails(
                          mealChoice: meals[index],
                        )),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
