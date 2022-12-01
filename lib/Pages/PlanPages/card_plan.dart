import 'dart:convert';
import 'dart:html';
// Se importa la libreria carousel_pro.dart con el fin de usar las propiedades de carousel
// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

import '../DetailsPages/food_details.dart';

//Esta contendrán las card que tienen las recetas del plan semanal (desde el dia 2 hasta el dia 7)
class Card_plan extends StatelessWidget {
  final ModelRandomFood food;

  const Card_plan({
    //Se indica que datos se desean mostrar
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //Se utiliza un GestureDetector y en el opTap para devolver un valor en caso de que se seleccione el contendor de la categoria
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details(food: food)),
          );
        },
        child: Container(
          height: 205,
          width: 170,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: primaryColor, width: 2.0),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        food.imgURL,
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  width: 190,
                  height: 80,
                  child: ListTile(
                    title: Text(
                        (food.name.length > 14)
                            ? food.name.substring(0, 14)
                            : food.name + "...",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center),
                    subtitle: Text(
                      "${food.category}",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
