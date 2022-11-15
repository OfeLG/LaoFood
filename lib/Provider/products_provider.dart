import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:loafood/Models/model_products.dart';

//Se crea la clase provider para obtener los datos disponible en la Api
class Auctions_Provider {
  //Se crea un metodo que devuelva una lista de tipo ModelProduct
  Future<List<ModelProducts>> getProducts() async {
    //Solo devolverá la lista luego que se realice la consulta y las validaciones

    //Se realiza la consulta y se guarda en resp
    final resp =
        await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    //Se valida si el statusCode es OK
    if (resp.statusCode == 200) {
      //Se usa la función utf8 para obtener los caracteres especiales que pueda tener resp
      String body = utf8.decode(resp.bodyBytes);
      //Se pasa Json para poder recorrerlo
      final jsonData = jsonDecode(body);
      //Se llama a la clase Products para recorrer y retornar en una lista los datos que se expecificaron en ModelProducts
      final products = Products.fromJsonList(jsonData);
      return products.items;
    } else {
      //En caso de no ser Ok mostrará una excepción con el error
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }

  Future<List<ModelProducts>> getCategory(String change_category) async {
    final resp = await http.get(Uri.parse(
        "https://fakestoreapi.com/products/category/$change_category"));

    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final products = Products.fromJsonList(jsonData);
      return products.items;
    } else {
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}
