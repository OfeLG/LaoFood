// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_foods.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

class SearchBar_Food extends StatefulWidget {
  const SearchBar_Food({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar_Food> createState() => _SearchBar_FoodState();
}

class _SearchBar_FoodState extends State<SearchBar_Food> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          //Se crea el widget que contendrá toda la parte del buscador (row)
          Row(
            children: [
              //Se usa el Expanded para que el container del TextField ocupe todo el epacio disponible de su padre (Row)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, //Se aplica color al contendor
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      //Se aplica sombra al contendor,
                      BoxShadow(color: Colors.black38, blurRadius: 4)
                    ],
                  ),
                  child: TextField(
                    //Se indica que al darle click TextField se llama automaticamente una función de flutter
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      //Se quita la linea inferior que tiene por defecto el TextField
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              //Se crea el boton de clasificación que tendrá la app
              Container(
                // Este contenedor tendrá dento el icono de
                decoration: BoxDecoration(
                  color: primaryColor, //Se aplica color al contendor
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    //Se aplica sombra al contendor,
                    BoxShadow(color: secondaryColor, blurRadius: 2)
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tune),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
