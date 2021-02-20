import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodegaapp/screens/food_added_screen.dart';
import 'package:foodegaapp/services/UserBloc.dart';
import 'BlocProvider.dart';

final firestoreInstance = FirebaseFirestore.instance;

Future<void> addUser(String email) async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  firestoreInstance.collection('users').doc(firebaseUser.uid).set(
    {
      'email': email,
      'uid': firebaseUser.uid,
    },
  );
  return;
}

void setAge(context) {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'age': BlocProvider.of<UserBloc>(context).userData.age,
    },
    SetOptions(merge: true),
  );
}

void setHeight(context) {
  var firebaseUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'height': BlocProvider.of<UserBloc>(context).userData.height,
    },
    SetOptions(merge: true),
  );
}

void setWeight(context) {
  var firebaseUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'weight': BlocProvider.of<UserBloc>(context).userData.weight,
    },
    SetOptions(merge: true),
  );
}

void setGender(context) {
  var firebaseUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'gender': BlocProvider.of<UserBloc>(context).userData.gender,
    },
    SetOptions(merge: true),
  );
}

void setGoal(context) {
  var firebaseUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'goal': BlocProvider.of<UserBloc>(context).userData.goal,
    },
    SetOptions(merge: true),
  );
}

void setCalories() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'calories': FieldValue.increment(FoodAddedScreen.calories),
    },
    SetOptions(merge: true),
  );
}

void setCarbs() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'carbs': FieldValue.increment(FoodAddedScreen.carbs),
    },
    SetOptions(merge: true),
  );
}

void setFat() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'fat': FieldValue.increment(FoodAddedScreen.fat),
    },
    SetOptions(merge: true),
  );
}

void setSugar() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'sugar': FieldValue.increment(FoodAddedScreen.sugar),
    },
    SetOptions(merge: true),
  );
}

void setProtein() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'protein': FieldValue.increment(FoodAddedScreen.protein),
    },
    SetOptions(merge: true),
  );
}
