import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:loafood/Models/model_foods.dart';

//Se crea una variable para saber qué modelo utilizar en model food
bool alert_plan = false;

class Foods_Provider_Str {
  List<ModelRandomFood> _foodsList = [];

  //STREAM PARA MODEL RANDOM
  final _FoodsStreamController =
      StreamController<List<ModelRandomFood>>.broadcast();
  Function(List<ModelRandomFood>) get FoodsSink =>
      _FoodsStreamController.sink.add;
  Stream<List<ModelRandomFood>> get FoodsStream =>
      _FoodsStreamController.stream;

  //STREAM PARA MODEL ID

  void disposeStreams() {
    _FoodsStreamController.close();
  }

  Future<List<ModelRandomFood>> getFoods() async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la consulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2?type=public&beta=true&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814&imageSize=REGULAR&random=true"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final foods = FoodRandom.fromJsonList(jsonData);

      _foodsList.addAll(foods.itemsRandom);
      FoodsSink(_foodsList);

      return foods.itemsRandom;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }

  Future<List<ModelRandomFood>> get_food_category(String valueCategory) async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la consulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2?type=public&beta=true&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814&mealType=${valueCategory}"));
    if (resp.statusCode == 200) {
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final foods = FoodRandom.fromJsonList(jsonData);

      _foodsList.addAll(foods.itemsRandom);
      FoodsSink(_foodsList);
      print("CONSULTA DE LA CATEGORIA: ${foods.itemsRandom}");
      return foods.itemsRandom;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }

  Future<List<ModelRandomFood>> getFoodSearch(String food_name) async {
    print("ENTRÓ AL FOOD_SEARCH");
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la conListsulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=$food_name&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //jsonDecode(rawJson) as Map<String, dynamic>
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final foods = FoodRandom.fromJsonList(jsonData);

      _foodsList.addAll(foods.itemsRandom);
      FoodsSink(_foodsList);

      print("LA BUSQUEDA del primer item es: ${foods.itemsRandom[0].name}");

      return foods.itemsRandom;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}
