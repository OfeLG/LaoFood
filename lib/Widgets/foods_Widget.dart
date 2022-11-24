import 'dart:convert';
import 'dart:html';

// Se importa el paquete material.dart
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_ingredients.dart';

import 'package:loafood/constants.dart';
import 'package:loafood/Models/model_foods.dart';

Widget Food_Widget(ModelIngredients data, double Cont_width, double cont_heigth,
    double img_heigth) {
  return Container(
    height: cont_heigth,
    width: Cont_width,
    margin: EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
      border:
          Border.all(width: 2, color: primaryColor, style: BorderStyle.solid),
    ),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: img_heigth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              data.imgURL,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Text(data.name,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ],
    ), //Se le asigna la imagen
  );
}
