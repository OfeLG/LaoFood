// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/category_foots.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

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
          //Category_Foots tiene el diseño del contenedor de la categoria (Así que solo se llama y se le pasan los datos a contener)
          Category_Foots(
            press: () {
              //Se define la funcion press, que en este caso es una función de tipo VoidCallback (category)
            },
            text: "breakfast",
            image: "assets/category_breakfast.jpg",
          ),
          //Para que hay un espacio entre el elemento de arriba y el de abajo
          SizedBox(
            height: 10,
          ),
          Category_Foots(
            press: () {},
            text: "lunch",
            image: "assets/category_lunch.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Foots(
            press: () {},
            text: "dinner",
            image: "assets/category_dinner.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Foots(
            press: () {},
            text: "snack",
            image: "assets/category_snack.jpg",
          )
        ],
      ),
    );
  }
}
