//Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/SearchPages/searchBar_food.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Provider/foods_provider.dart';

import '../DetailsPages/food_details.dart';
import '../bottomNavBar.dart';

class Body_SearchFood extends StatefulWidget {
  const Body_SearchFood({super.key});
  @override
  State<Body_SearchFood> createState() => _Body_SearchFoodState();
}

class _Body_SearchFoodState extends State<Body_SearchFood> {
  late Future<List<ModelRandomFood>> foodsList;
  bool isLike = false;
  final Color inactiveColor = Colors.black38;

  @override
  void initState() {
    //foodsList es una instancia de la clase Foods_Provider
    previous_view = "Body_SearchFood";
    foodsList = Foods_Provider().getFoodSearch(
        food_name); //Se llama al metodo getFoods de esa clase para obtener los datos de la Api
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se utiliza el FutureBuilder ya que la interfaz está a la espera de que la foodsList tega los datos de la consutal de la Api
      body: FutureBuilder<List<ModelRandomFood>>(
        future: foodsList,
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
                        "Search recipes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: secondaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    SearchBar_Food(),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 600,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70, //0.70
                          ),
                          itemBuilder: (BuildContext context, index) {
                            //Sele asignan los datos
                            return AllSingleProducts(
                              foodsList: snapshot.data![index],
                            );
                          }),
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
