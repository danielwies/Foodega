import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestoreInstance = FirebaseFirestore.instance;

Future<String> getUserEmail() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _email = mapData['email'];
  return _email.toString();
}

Future<String> getUserGender() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _gender = mapData['gender'];
  return _gender.toString();
}

Future<int> getUserAge() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _age = mapData['age'];
  return _age;
}

Future<int> getUserHeight() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _height = mapData['height'];
  return _height;
}

Future<int> getUserWeight() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _weight = mapData['weight'];
  return _weight;
}

Future<String> getUserGoal() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _goal = mapData['goal'];
  return _goal.toString();
}

Future<int> getUserCarbs() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _carbs = mapData['carbs'];
  return _carbs;
}

Future<int> getUserFat() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _fat = mapData['fat'];
  return _fat;
}

Future<int> getUserSugar() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _sugar = mapData['sugar'];
  return _sugar;
}

Future<int> getUserProtein() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _protein = mapData['protein'];
  return _protein;
}

Future<int> getUserCalories() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot _ds = await FirebaseFirestore.instance
      .collection('users')
      .doc(firebaseUser.uid)
      .get();

  Map mapData = _ds.data();
  var _calories = mapData['calories'];
  return _calories;
}
