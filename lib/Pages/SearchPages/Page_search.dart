// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/Basket_pages/searchBar_ingredients.dart';
import 'package:loafood/Pages/FavoritesPages/favoritePage.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/SearchPages/searchBar_food.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

import '../../Models/model_foods.dart';
import '../../Provider/foods_provider_Str.dart';
import '../DetailsPages/food_details.dart';

class PageSearch extends StatefulWidget {
  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  final foods_provider = Foods_Provider_Str();
  bool isLike = false;
  final Color inactiveColor = Colors.black38;

  @override
  void initState() {
    previous_view = "PageSearch";
    //foodsList es una instancia de la clase Foods_Provider
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (food_name.length == 0) {
      foods_provider.getFoods();
    } else {
      foods_provider.getFoodSearch(food_name);
    }

    return Scaffold(
      // Se utiliza el FutureBuilder ya que la interfaz está a la espera de que la foodsList tega los datos de la consutal de la Api
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
              child:
                  GridView_Search(context: context, foodsList: foods_provider),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class GridView_Search extends StatelessWidget {
  final BuildContext context;
  final Foods_Provider_Str foodsList;
  const GridView_Search(
      {super.key, required this.context, required this.foodsList});
  @override
  Widget build(BuildContext context) {
    //Se crea la cuadricula de cuantas columnas se desea mostrar
    return StreamBuilder(
      stream: foodsList.FoodsStream,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: (snapshot.data as List<ModelRandomFood>).length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (BuildContext context, index) {
              //Sele asignan los datos
              return AllSingleProducts(
                foodsList: (snapshot.data as List<ModelRandomFood>)[index],
              );
            },
          );
        } else {
          print("NO ENTRÓ - PASÓ ALGO EN LA BUSQUEDA");
          print(snapshot.error);
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
