import 'package:foodegaapp/models/UserData.dart';
import 'BlocInterface.dart';

class UserBloc implements BlocInterface {
  UserData userData;
  UserBloc(UserData userData) {
    this.userData = userData;
  }

  @override
  void dispose() {}

  void setAge(int newAge) {
    this.userData.age = newAge;
  }

  int getAge() => this.userData.age;

  void setHeight(int newHeight) {
    this.userData.height = newHeight;
  }

  int getHeight() => this.userData.height;

  void setWeight(int newWeight) {
    this.userData.weight = newWeight;
  }

  int getWeight() => this.userData.weight;

  void setGender(String gender) {
    this.userData.gender = gender;
  }

  String getGender() => this.userData.gender;

  void setGoal(String goal) {
    this.userData.goal = goal;
  }

  String getGoal() => this.userData.goal;

  void setCalories(double calories) {
    this.userData.calories = calories;
  }

  double getCalories() => this.userData.calories;

  void setCarbs(int carbs) {
    this.userData.carbs = carbs;
  }

  int getCarbs() => this.userData.carbs;

  void setSugar(int sugar) {
    this.userData.sugar = sugar;
  }

  int getSugar() => this.userData.sugar;

  void setFat(int fat) {
    this.userData.fat = fat;
  }

  int getFat() => this.userData.fat;

  void setProtein(int protein) {
    this.userData.protein = protein;
  }

  int getProtein() => this.userData.protein;
}
