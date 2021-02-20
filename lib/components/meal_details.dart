import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodegaapp/models/FoodData.dart';
import 'package:foodegaapp/models/FoodStore.dart';
import 'package:foodegaapp/screens/food_added_screen.dart';

class MealDetails extends StatelessWidget {
  final String mealChoice;

  MealDetails({@required this.mealChoice});

  buildTile(BuildContext context, FoodData food, {VoidCallback onTap}) {
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          food.title,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              food.kcal.toString() + "kcal",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Text(
              food.description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Text(
              food.weight.toString() + 'g',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        trailing: Icon(
          Icons.add,
          color: Colors.white,
          size: MediaQuery.of(context).size.height / 25,
        ),
        onTap: () => onTap?.call(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(mealChoice).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot food = snapshot.data.docs[index];
              FoodData currentItem = FoodData.fromJson(food.data());
              return buildTile(
                context,
                currentItem,
                onTap: () {
                  FoodStore.addToListUnique(currentItem);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodAddedScreen(
                        selectedItems: FoodStore.getList(),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
