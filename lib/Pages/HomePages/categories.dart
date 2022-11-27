// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/HomePages/category_foods.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/HomePages/category_foods.dart';

class Categories extends StatefulWidget {
  //Se declara una función que tendrá como fin ejecutar la consulta de una categoria en especifico
  final void Function(String) change; //La funcion se definirá en HomeBody
  Categories({Key? key, required this.change}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    //Se crea un contenedor con el fin de colocarle una altura a todo lo que se encuentra en lisview
    return Container(
      height: 150,
      color: backgraundApp,
      //Se crea un listView que contenga cada una de las categorias para así poderle colocar desplazamiento horizontal
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          //Category_Foods tiene el diseño del contenedor de la categoria (Así que solo se llama y se le pasan los datos a contener)
          Category_Foods(
            press: () {
              widget.change("Breakfast");
              //Se define la funcion press, que en este caso es una función de tipo VoidCallback (category)
            },
            text: "Breakfast",
            image: "assets/category_breakfast.jpg",
          ),
          //Para que hay un espacio entre el elemento de arriba y el de abajo
          SizedBox(
            height: 10,
          ),
          Category_Foods(
            press: () {
              widget.change("Lunch");
            },
            text: "Lunch/Dinner",
            image: "assets/category_lunch.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Foods(
            press: () {
              widget.change("Snack");
            },
            text: "Snack",
            image: "assets/category_snack.jpg",
          )
        ],
      ),
    );
  }
}
