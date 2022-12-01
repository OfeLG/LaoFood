// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Pages/SearchPages/Page_search.dart';
import 'package:loafood/Pages/enum.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

import 'card_ingredients.dart';

String food_name = "";

class SearchBar_Food extends StatefulWidget {
  const SearchBar_Food({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar_Food> createState() => _SearchBar_FoodState();
}

// Aca se encuentra la barra del search y el filtro
class _SearchBar_FoodState extends State<SearchBar_Food> {
  final myController = TextEditingController();
  bool prueba = true;

  @override
  void initState() {
    if (ingr_Basket.length > 4) {
      prueba = false;
    }
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

// Este contendrá la función del filtro
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: backgraundApp,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              border: Border.all(
                  width: 2, color: primaryColor, style: BorderStyle.solid),
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                Text(
                  "Filter by my ingredients",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                ingr_Basket.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Icon(
                            Icons.shopping_basket_outlined,
                            color: secondaryColor.withOpacity(0.2),
                            size: 70,
                          ),
                          ListTile(
                            title: Text(
                              "NO INGREDIENTS",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor.withOpacity(0.2)),
                              textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                              "To add ingredients, go to the basket section",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor.withOpacity(0.2)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: 330,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: prueba ? 170 : 300,
                              child: GridView.builder(
                                itemCount: ingr_Basket.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.2,
                                ),
                                itemBuilder: (BuildContext context, index) {
                                  //Sele asignan los datos
                                  return Card_Ingredient(
                                      ingredientList: ingr_Basket[index]);
                                },
                              ),
                            ),

                            //BOTON 40 en w
                            Positioned(
                              bottom: 1,
                              left: 0,
                              right: 0,
                              child: TextButton(
                                onPressed: () {
                                  for (var item in list_search) {
                                    if (food_name == "") {
                                      food_name = item;
                                    } else {
                                      food_name = " " + item;
                                    }
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PageSearch()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: secondaryColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    side: BorderSide(
                                      width: 3.0,
                                      color: secondaryColor,
                                    ),
                                    minimumSize: Size(double.infinity, 50),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    )),
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          );
        });
  }

// Este si contiene la barra
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
                      food_name = myController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageSearch()),
                      );
                    },

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
                  onPressed: () => displayBottomSheet(
                      context), // Aca se llama la función que se creo arriba
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
