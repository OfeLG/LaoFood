// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/HomePages/home.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Widgets/img_details.dart';
import 'package:loafood/Models/model_foods.dart';

import '../../Provider/foods_provider_Str.dart';
import '../../Widgets/yield_details.dart';
import '../FavoritesPages/favoritePage.dart';
import '../PlanPages/myPlan.dart';
import '../SearchPages/Page_search.dart';
import 'info_details.dart';
import '../bottomNavBar.dart';

// Esta clase contiene la estructura de la pagina de details (Acá se llama a info_details y se llama img_details)
class Details extends StatefulWidget {
  final ModelRandomFood food;
  const Details({super.key, required this.food});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: 38,
                        height: 38,
                        padding: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          //Se le asigna el color del contenedor del primer icono
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Builder(
                          builder: (context) => IconButton(
                            //Se agrega el primer icono que tendrá el appBar
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: secondaryColor,
                              size: 24,
                            ),
                            //Se agrega la funcionalidad que tendrá dicho icono
                            onPressed: () {
                              if (previous_view == "HomeBody") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              } else if (previous_view == "Favorite") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Favorite()),
                                );
                              } else if (previous_view == "PageSearch") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PageSearch()),
                                );
                              } else if (previous_view == "MyPlan") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPlan()),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          //Se le asigna el color del contenedor del primer icono
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Builder(
                          builder: (context) => IconButton(
                            //Se agrega el primer icono que tendrá el appBar
                            icon: Icon(
                              Icons.favorite_outline,
                              color: secondaryColor,
                              size: 24,
                            ),
                            //Se agrega la funcionalidad que tendrá dicho icono
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ImgDetails(food: widget.food),
                InfoDetails(food: widget.food),
              ],
            ),
          ),
          floatingActionButton: Yield_Widget(food: widget.food),
        ),
      ),
      bottomNavigationBar: BottomNavBar(), //TEMPORAL
    );
  }
}
