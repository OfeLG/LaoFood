import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:loafood/Models/model_foots.dart';

//Se crea la clase provider para obtener los datos disponible en la Api
class Foots_Provider {
  //Se crea un metodo que devuelva una lista de tipo ModelFoot
  Future<List<ModelRandomFood>> getFoots() async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones

    //Se realiza la consulta y se guarda en resp
    final resp = await http.get(Uri.parse(
        "https://api.edamam.com/api/recipes/v2?type=public&beta=true&app_id=f23499df&app_key=68ef7dd0cf57661f34ff6929bbf40814&imageSize=LARGE&random=true"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //jsonDecode(rawJson) as Map<String, dynamic>
      //Se llama a la clase Foots para recorrer y retornar en una lista los datos que se expecificaron en ModelFoots
      final Foots = Food.fromJsonList(jsonData);
      return Foots.items;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}

// getCategory