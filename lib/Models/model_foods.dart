import 'package:loafood/Provider/foods_provider.dart';

class FoodRandom {
  List<ModelRandomFood> itemsRandom = [];

  FoodRandom();

  FoodRandom.fromJsonList(jsonList) {
    if (jsonList == null) {
      print("NO HAY NADA EN LA LISTA - RETURN");
      return;
    }
    int i = 0;
    for (var item in jsonList["hits"]) {
      if (alert_plan == true && i == 7) {
        break;
      }
      final food = new ModelRandomFood.fromJsonMap(item);
      itemsRandom.add(food);
      i++;
    }
  }
}

class ModelRandomFood {
  late String name;
  late double time;
  late String category;
  late String imgURL;
  late double calories;
  late List recipe = [];
  late List ingredients = [];
  late double yield;
  late String cuisineType;

  ModelRandomFood(
      {required this.name,
      required this.time,
      required this.category,
      required this.imgURL,
      required this.calories,
      required this.recipe,
      required this.ingredients,
      required this.yield,
      required this.cuisineType});

  ModelRandomFood.fromJsonMap(Map<String, dynamic> json) {
    name = json["recipe"]["label"];
    time = json["recipe"]["totalTime"];
    category = json["recipe"]["mealType"][0];
    imgURL = json["recipe"]["images"]["REGULAR"]["url"];
    calories = json["recipe"]["calories"];
    for (var item in json["recipe"]["ingredientLines"]) {
      recipe.add(item.replaceAll("*", ""));
    }
    for (var item in json["recipe"]["ingredients"]) {
      ingredients.add({"name": item["food"], "image": item["image"]});
    }
    yield = json["recipe"]["yield"];
    cuisineType = json["recipe"]["cuisineType"][0];
  }
}
