import 'dart:convert';
import 'dart:html';

// Se importa el paquete material.dart
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_ingredients.dart';

import 'package:loafood/constants.dart';
import 'package:loafood/Models/model_foods.dart';

import '../Provider/foods_provider_Str.dart';

Widget Yield_Widget({required ModelRandomFood food}) {
  return Container(
    width: 80,
    height: 46,
    child: RawMaterialButton(
      fillColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.group,
            color: Colors.white,
            size: 25,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              food.yield.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ), //Añadir cantidad de personas a comer
          ),
        ],
      ),
      onPressed: () {},
    ),
  );
}
