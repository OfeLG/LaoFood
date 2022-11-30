// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Models/model_ingredients.dart';
import 'package:loafood/Pages/Basket_pages/searchBar_ingredients.dart';
import 'package:loafood/Pages/SearchPages/Page_search.dart';
import 'package:loafood/Pages/SearchPages/searchBar_food.dart';
import 'package:loafood/Pages/enum.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

class Card_Ingredient extends StatefulWidget {
  final ModelIngredients ingredientList;
  const Card_Ingredient({
    Key? key,
    required this.ingredientList,
  }) : super(key: key);

  @override
  State<Card_Ingredient> createState() => _Card_IngredientState();
}

class _Card_IngredientState extends State<Card_Ingredient> {
  bool is_Selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          //Sele asignan los datos
          setState(() {
            is_Selected = !is_Selected;
          });

          if (list_search.length == 0) {
            list_search.add(widget.ingredientList.name);
          } else {
            if (list_search.contains(widget.ingredientList.name)) {
              int index = list_search.indexOf(widget.ingredientList
                  .name); // Me retorna el indice donde se encuentra
              list_search.removeAt(index);
            } else {
              list_search.add(widget.ingredientList.name);
            }
          }
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: is_Selected ? primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2, color: primaryColor, style: BorderStyle.solid),
          ),
          child: Text(
            widget.ingredientList.name,
            style: TextStyle(
              color: is_Selected ? Colors.white : Colors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
