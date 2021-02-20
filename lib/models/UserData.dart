class UserData {
  int age;
  int height;
  int weight;
  String gender;
  String goal;
  String id;
  double calories;
  int carbs;
  int sugar;
  int fat;
  int protein;

  UserData(
      {this.age = 25,
      this.height = 175,
      this.weight = 75,
      this.gender,
      this.goal,
      this.id,
      this.calories,
      this.carbs,
      this.sugar,
      this.fat,
      this.protein});

  factory UserData.fromJson(Map<String, dynamic> json) {
    UserData user = UserData();
    UserData.parse(user, json);
    return user;
  }

  static void parse(UserData user, Map<String, dynamic> json) {
    user.age = int.tryParse(json["age"]) ?? -1;
    user.height = int.tryParse(json["height"]) ?? -1;
    user.weight = int.tryParse(json["weight"]) ?? -1;
    user.gender = json["gender"] ?? "";
    user.goal = json["goal"] ?? "";
    user.calories = double.tryParse(json["calories"]) ?? -1;
    user.carbs = int.tryParse(json["carbs"]) ?? -1;
    user.sugar = int.tryParse(json["sugar"]) ?? -1;
    user.fat = int.tryParse(json["fat"]) ?? -1;
    user.protein = int.tryParse(json["protein"]) ?? -1;
  }
}
