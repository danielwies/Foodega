import 'package:foodegaapp/models/FoodData.dart';

class FoodStore {
  static final List<FoodData> foodList = List();
  static List<FoodData> getList() => FoodStore.foodList;

  static addToListUnique(FoodData newValue) {
    if (FoodStore.foodList
        .where((FoodData e) => e.title == newValue.title)
        .isEmpty) {
      FoodStore.foodList.add(newValue);
    }
  }
}
