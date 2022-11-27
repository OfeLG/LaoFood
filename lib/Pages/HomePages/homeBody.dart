// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/HomePages/customAppBar.dart';
import 'package:loafood/Pages/HomePages/slider.dart';
import 'package:loafood/Pages/HomePages/categories.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Provider/foods_provider.dart';

import '../enum.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  //Se declara una lista de tipo ModelFoods con future, ya que se esperará a que Foods_List sea llenada con datos
  late Future<List<ModelRandomFood>> foodsList;

  @override
  void initState() {
    previous_view = "HomeBody";
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
            //snapshot.data representa los datos obtenidos
            if (snapshot.hasData) {
              //Se verifica si snapshot.hasData tiene datos o no
              //Se usará el widget SafeArea para mostrar la barra de usuario que tendrá la aplicación
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      //Se crea el appbar de la app
                      CustomAppBar(),
                      //Espacio entre la barra principal y la barra de busqueda
                      SizedBox(
                        height: 10,
                      ),
                      //Se crea la sección de categorias que tendrá la aplicación
                      Categories(
                        change: (String valueCategory) {
                          setState(() {
                            foodsList = Foods_Provider()
                                .get_food_category(valueCategory);
                          });
                          print("setState");
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Se crea el slider que contendrá algunas de las imagenes de de la comida del día
                      Food_Slider(foodsList: snapshot.data!),
                      SizedBox(
                        height: 20,
                      ),
                      //Se crea la sección de todos las comidas
                      Container(
                          height: 300,
                          color: backgraundApp,
                          child: AllFoods(foodsList: snapshot.data!)),
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
          }),
      drawer: Drawer(),
    );
  }
}
