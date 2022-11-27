import 'dart:convert';
import 'dart:html';
// Se importa la libreria carousel_pro.dart con el fin de usar las propiedades de carousel
//import 'package:carousel_pro/carousel_pro.dart';

// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Models/model_foods.dart';

List<Widget> Widget_Carousel(List<ModelRandomFood> data) {
  //foods se crea para agregar en él la lista de widgets (en este caso serán imagenes las que se agregarán)
  List<Widget> foods = [];
  int cont = 0;
  for (var food in data) {
    //Se recorre la lista (data) qcon el fin de ir agregando uno a uno sus elementos a un widget Image
    foods.add(Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                food.imgURL,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 305,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 2, color: primaryColor, style: BorderStyle.solid),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    child: ListTile(
                      title: Text(
                        (food.name.length > 30)
                            ? food.name.substring(0, 30)
                            : food.name + "...",
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "${food.category}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: primaryColor),
                      ), //para que puestre solo 20 caracteres de la descripción
                      //Se usa el widget trailing para crear la opción de favorito que tendrá la app
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Container(
                            width: 90,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 24,
                                  color: primaryColor,
                                ),
                                Text(food.time.toString() + " Mn")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Container(
                            width: 90,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  size: 24,
                                  color: primaryColor,
                                ),
                                Text((food.calories.toString().length > 4)
                                    ? food.calories.toString().substring(0, 4)
                                    : food.calories.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
  return (foods);
}

/*
foods.add(
      Image.network(food.imgURL),
    );
*/
