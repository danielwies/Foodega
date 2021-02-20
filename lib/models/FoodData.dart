class FoodData {
  int kcal;
  String description;
  String title;
  int calories;
  int weight;
  int carbs;
  int protein;
  int fat;
  int sugar;

  FoodData(
      {this.kcal,
      this.description,
      this.title,
      this.weight,
      this.calories,
      this.carbs,
      this.protein,
      this.fat,
      this.sugar});

  factory FoodData.fromJson(Map<String, dynamic> json) {
    FoodData food = FoodData();
    FoodData.parse(food, json);
    return food;
  }

  static void parse(FoodData item, Map<String, dynamic> json) {
    item.title = json["title"] ?? "";
    item.kcal = int.tryParse(json["calories"]) ?? -1;
    item.description = json["description"] ?? "";
    item.calories = int.tryParse(json["calories"]) ?? -1;
    item.weight = int.tryParse(json["weight"]) ?? -1;
    item.carbs = int.tryParse(json["carbs"]) ?? -1;
    item.protein = int.tryParse(json["protein"]) ?? -1;
    item.fat = int.tryParse(json["fat"]) ?? -1;
    item.sugar = int.tryParse(json["sugar"]) ?? -1;
  }
}
