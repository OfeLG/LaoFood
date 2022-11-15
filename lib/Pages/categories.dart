// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/category_products.dart';

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
      //Se crea un listView que contenga cada una de las categorias para así poderle colocar desplazamiento horizontal
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          //Category_Products tiene el diseño del contenedor de la categoria (Así que solo se llama y se le pasan los datos a contener)
          Category_Products(
            press: () {
              //Se define la funcion press, que en este caso es una función de tipo VoidCallback (category)
              widget.change("jewelery");
            },
            text: "breakfast",
            image: "assets/category_breakfast.jpg",
          ),
          //Para que hay un espacio entre el elemento de arriba y el de abajo
          SizedBox(
            height: 10,
          ),
          Category_Products(
            press: () {
              widget.change("men's clothing");
            },
            text: "lunch",
            image: "assets/category_lunch.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Products(
            press: () {},
            text: "dinner",
            image: "assets/category_dinner.jpg",
          ),
          SizedBox(
            height: 10,
          ),
          Category_Products(
            press: () {
              widget.change("electronics");
            },
            text: "snack",
            image: "assets/category_snack.jpg",
          )
        ],
      ),
    );
  }
}
