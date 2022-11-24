//Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/Basket_pages/searchBar_ingredients.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/HomePages/home.dart';
import 'package:loafood/Provider/ingredients_provider.dart';
import 'package:loafood/Widgets/ingredient_Widget.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Models/model_ingredients.dart';
import 'package:loafood/Provider/foods_provider.dart';

import '../bottomNavBar.dart';

class Body_MySearch extends StatefulWidget {
  const Body_MySearch({super.key});
  @override
  State<Body_MySearch> createState() => _Body_MySearchState();
}

class _Body_MySearchState extends State<Body_MySearch> {
  late Future<ModelIngredients> ingredient;

  bool isLike = false;
  final Color inactiveColor = Colors.black.withOpacity(0.3);

  @override
  void initState() {
    //foodsList es una instancia de la clase Foods_Provider
    ingredient = Ingredients_Provider().getIngredient(
        name_ingredient); //Se llama al metodo getFoods de esa clase para obtener los datos de la Api
    print("INGREDIENTE: + ${name_ingredient}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ModelIngredients>(
        future: ingredient,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Add Ingredients",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: secondaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    SearchBar_Ingr(),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 250,
                            child: Ingredient_Widget(snapshot.data!,
                                double.infinity, double.infinity, 200),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            padding: EdgeInsets.only(right: 42, top: 9),
                            //Se indica la acción que tendrá el icono en caso de darle click
                            onPressed: () {
                              setState(() {
                                isLike = !isLike;
                              });
                              if (ingr_Basket.length == 0) {
                                ingr_Basket.add(snapshot.data!);
                              } else {
                                print("ENTRÓ EN EL ELSE");
                                for (int i = 0; i < ingr_Basket.length; i++) {
                                  print("iS: ${ingr_Basket[i].name}");
                                  print("LISTA: ${snapshot.data!.name}");
                                  if (ingr_Basket[i].name ==
                                      snapshot.data!.name) {
                                    break;
                                  } else if (ingr_Basket[i].name !=
                                          snapshot.data!.name &&
                                      i == ingr_Basket.length - 1) {
                                    ingr_Basket.add(snapshot.data!);
                                  }
                                }
                              }
                            },
                            //Se le asigna el icono
                            icon: Icon(
                              isLike ? Icons.add_box : Icons.add_box_outlined,
                              color: isLike ? secondaryColor : inactiveColor,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            //En caso de que snapshot.hasData no devuelva nada
            print(snapshot.error);
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
