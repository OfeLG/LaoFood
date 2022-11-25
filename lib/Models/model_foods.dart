import 'package:loafood/Provider/foods_provider.dart';

class FoodRandom {
  List<ModelRandomFood> itemsRandom = [];

  FoodRandom();

  FoodRandom.fromJsonList(jsonList) {
    if (jsonList == null) {
      print("NO HAY NADA EN LA LISTA - RETURN");
      return;
    }
    for (var item in jsonList["hits"]) {
      print("ESTÁ RECORRIENDO LA LISTA");
      final food = new ModelRandomFood.fromJsonMap(item);
      food.id = food.id
          .replaceAll("http://www.edamam.com/ontologies/edamam.owl#", "");
      itemsRandom.add(food);
    }
  }
}

class FoodID {
  List<ModelFoodId> itemsId = [];

  FoodID();

  FoodID.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    }
    ;
    final food = new ModelFoodId.fromJsonMap(jsonList);
    itemsId.add(food);
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
    print("nombre: ${json["recipe"]["label"]}");
    id = json["recipe"]["uri"];
    print("id: ${json["recipe"]["uri"]}");
    time = json["recipe"]["totalTime"];
    print("time: ${json["recipe"]["tatalTime"]}");
    category = json["recipe"]["mealType"][0];
    print("category: ${json["recipe"]["mealType"]}");
    imgURL = json["recipe"]["images"]["REGULAR"]["url"];
    print("img: ${json["recipe"]["images"]["REGULAR"]["url"]}");
    calories = json["recipe"]["calories"];
    print("calorias: ${json["recipe"]["calorias"]}");
  }
}

class ModelFoodId {
  late String name;
  late double time;
  late String category;
  late String imgURL;
  late double calories;
  late List recipe = [];
  late List ingredients = [];
  late double yield;
  late String cuisineType;

  ModelFoodId(
      {required this.name,
      required this.time,
      required this.category,
      required this.imgURL,
      required this.calories,
      required this.recipe,
      required this.ingredients,
      required this.yield,
      required this.cuisineType});

  ModelFoodId.fromJsonMap(Map<String, dynamic> json) {
    name = json["recipe"]["label"];
    time = json["recipe"]["totalTime"];
    category = json["recipe"]["mealType"][0];
    imgURL = json["recipe"]["images"]["LARGE"]["url"];
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
