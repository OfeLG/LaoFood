// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/Basket_pages/body_search_myBasket.dart';
import 'package:loafood/Pages/Basket_pages/myBasket.dart';
import 'package:loafood/Pages/enum.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Models/model_ingredients.dart';
import 'package:loafood/Models/model_ingredients.dart';

String name_ingredient = "";

// Esta clase contendrá la barra del buscador que se encuentra en Basket
class SearchBar_Ingr extends StatefulWidget {
  const SearchBar_Ingr({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar_Ingr> createState() => _SearchBar_IngrState();
}

class _SearchBar_IngrState extends State<SearchBar_Ingr> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
                    controller: myController,
                    //Se indica que al darle click TextField se llama automaticamente una función de flutter
                    onSubmitted: (value) {
                      name_ingredient = myController.text;
                      if (name_ingredient.length == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyBasket()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Body_MySearch()),
                        );
                      }
                    },
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
            ],
          ),
        ],
      ),
    );
  }
}
