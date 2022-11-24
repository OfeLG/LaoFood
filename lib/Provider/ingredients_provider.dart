import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Models/model_ingredients.dart';

//Se crea una variable para saber qué modelo utilizar en model food

//Se crea la clase provider para obtener los datos disponible en la Api
class Ingredients_Provider {
  Future<ModelIngredients> getIngredient(String ingr) async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones
    //Se realiza la conListsulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/food-database/v2/parser?app_id=15584dc5&app_key=65c5949cfe7385279be1951ba06c3eea&ingr=${ingr}"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      print("OKEY = 200 2");
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      print("JSON: ${jsonData}");
      //jsonDecode(rawJson) as Map<String, dynamic>
      //Se llama a la clase Foods para recorrer y retornar en una lista los datos que se expecificaron en ModelFoods
      final ingredient = Ingredients.fromJsonList(jsonData);
      return ingredient.itemsIngr[0];
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}
