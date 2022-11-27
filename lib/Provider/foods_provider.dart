import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:loafood/Models/model_foods.dart';

//Se crea una variable para saber qué modelo utilizar en model food
bool alert_plan = false;

//Se crea la clase provider para obtener los datos disponible en la Api
class Foods_Provider {
  //Se crea un metodo que devuelva una lista de tipo ModelFood
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

      return foods.itemsRandom;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }

  Future<List<ModelRandomFood>> getFoodSearch(String food_name) async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la conListsulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=${food_name}&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //jsonDecode(rawJson) as Map<String, dynamic>
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final foods = FoodRandom.fromJsonList(jsonData);
      print("FOODS BUSQUEDA: ${foods.itemsRandom}");
      return foods.itemsRandom;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }

  Future<List<ModelRandomFood>> get_food_category(String valueCategory) async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la conListsulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2?type=public&beta=true&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814&mealType=${valueCategory}"));
    //Se valida si el statusCode es OK
    print("HACE LA CATEGORIA EN PROVIDER");
    if (resp.statusCode == 200) {
      print("OKEY = 200 de la busqueda");
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);

      //jsonDecode(rawJson) as Map<String, dynamic>
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final foods = FoodRandom.fromJsonList(jsonData);
      return foods.itemsRandom;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }

  Future<List<List<ModelRandomFood>>> get_plan() async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la conListsulta y se guarda en resp

    List<List<ModelRandomFood>> Plan = [];
    alert_plan = true;

    for (int i = 0; i < 3; i++) {
      if (i == 0) {
        final plan1 = await get_food_category("Breakfast");
        Plan.add(plan1);
      } else if (i == 1) {
        final plan2 = await get_food_category("Lunch");
        Plan.add(plan2);
      } else {
        final plan3 = await get_food_category("Snack");
        Plan.add(plan3);
      }
    }
    alert_plan = false;
    return Plan;
  }

  Future<ModelFoodId> getFoodId(String ID) async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la conListsulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2/$ID?type=public&beta=true&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      print("OKEY = 200 2");
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //jsonDecode(rawJson) as Map<String, dynamic>
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final Food = FoodID.fromJsonList(jsonData);
      return Food.itemsId[0];
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}
