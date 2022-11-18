class Food {
  List<ModelRandomFood> items = [];

  Food();

  Food.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    }
    ;
    for (var item in jsonList["hits"]) {
      final product = new ModelRandomFood.fromJsonMap(item);
      items.add(product);
    }
  }
}

class ModelRandomFood {
  late String name;
  late String id;
  late double time;
  late String category;
  late String imgURL;
  late double calories;

  ModelRandomFood(
      {required this.name,
      required this.id,
      required this.time,
      required this.category,
      required this.imgURL,
      required this.calories});

  ModelRandomFood.fromJsonMap(Map<String, dynamic> json) {
    name = json["recipe"]["label"];
    id = json["recipe"]["uri"];
    time = json["recipe"]["totalTime"];
    category = json["recipe"]["mealType"][0];
    imgURL = json["recipe"]["images"]["LARGE"]["url"];
    calories = json["recipe"]["calories"];
  }
}
