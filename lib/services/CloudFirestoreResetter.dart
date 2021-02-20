import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestoreInstance = FirebaseFirestore.instance;

void resetCalories() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'calories': 0,
    },
    SetOptions(merge: true),
  );
}

void resetProtein() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'protein': 0,
    },
    SetOptions(merge: true),
  );
}

void resetFat() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'fat': 0,
    },
    SetOptions(merge: true),
  );
}

void resetCarbs() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'carbs': 0,
    },
    SetOptions(merge: true),
  );
}

void resetSugar() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(
    {
      'sugar': 0,
    },
    SetOptions(merge: true),
  );
}
