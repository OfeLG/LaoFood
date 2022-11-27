// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/HomePages/home.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Widgets/img_details.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Provider/foods_provider.dart';

import '../FavoritesPages/favoritePage.dart';
import '../PlanPages/myPlan.dart';
import '../SearchPages/Page_search.dart';
import '../SearchPages/body_search_Food.dart';
import 'info_details.dart';
import '../bottomNavBar.dart';

class Details extends StatefulWidget {
  const Details({super.key});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Future<ModelFoodId> foodId;

  @override
  void initState() {
    //foodsList es una instancia de la clase Foods_Provider
    foodId = Foods_Provider().getFoodId(
        ID); //Se llama al metodo getFoods de esa clase para obtener los datos de la Api
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ModelFoodId>(
        future: foodId,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
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
                                    } else if (previous_view ==
                                        "Body_SearchFood") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Body_SearchFood()),
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
                      ImgDetails(foodId: snapshot.data!),
                      InfoDetails(foodId: snapshot.data!),
                    ],
                  ),
                ),
                floatingActionButton: Container(
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
                            snapshot.data!.yield.toString(),
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
      bottomNavigationBar: BottomNavBar(), //TEMPORAL
    );
  }
}

/*
Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
*/