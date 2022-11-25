// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/FavoritesPages/favoritePage.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/SearchPages/searchBar_food.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

import '../../Models/model_foods.dart';
import '../../Provider/foods_provider.dart';
import '../DetailsPages/food_details.dart';

class PageSearch extends StatefulWidget {
  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  late Future<List<ModelRandomFood>> foodsList;
  //Se crean dos variables para llevar el control del icono favorito que tienen los contendores de los productos
  bool isLike = false;
  final Color inactiveColor = Colors.black38;

  @override
  void initState() {
    //foodsList es una instancia de la clase Foods_Provider
    foodsList = Foods_Provider()
        .getFoods(); //Se llama al metodo getFoods de esa clase para obtener los datos de la Api
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
