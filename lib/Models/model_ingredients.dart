import 'package:loafood/Provider/foods_provider.dart';

// Se crea la clase Ingredients para recorrer los datos de la consulta
class Ingredients {
  // Se crea la lista en la que se meterán los datos a tomar
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

// La clase que obtendrá los tipos de datos a recolectar (Es como nuestro map)
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
