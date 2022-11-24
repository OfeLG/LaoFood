import 'package:loafood/Provider/foods_provider.dart';

class Ingredients {
  List<ModelIngredients> itemsIngr = [];

  Ingredients();

  Ingredients.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    }
    ;
    final food = new ModelIngredients.fromJsonMap(jsonList);
    itemsIngr.add(food);
  }
}

class ModelIngredients {
  late String name;
  late String imgURL;

  ModelIngredients({required this.name, required this.imgURL});

  ModelIngredients.fromJsonMap(Map<String, dynamic> json) {
    print("IMAGE ${json["parsed"][0]["food"]["image"]}");
    name = json["parsed"][0]["food"]["label"];
    imgURL = json["parsed"][0]["food"]["image"];
  }
}
