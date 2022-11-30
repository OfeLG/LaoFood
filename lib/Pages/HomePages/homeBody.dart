// Se importa el paquete material.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loafood/Pages/HomePages/home.dart';
import 'package:loafood/Provider/foods_provider_Str.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/HomePages/customAppBar.dart';
import 'package:loafood/Pages/HomePages/slider.dart';
import 'package:loafood/Pages/HomePages/categories.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Provider/foods_provider.dart';

import '../enum.dart';

String categ = "";

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  //Se declara una lista de tipo ModelFoods con future, ya que se esperará a que Foods_List sea llenada con datos
  final foods_provider = Foods_Provider_Str();
  late List<ModelRandomFood> list_f;

  @override
  void initState() {
    previous_view = "HomeBody";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Se implementa el build
    if (categ.length == 0) {
      foods_provider.getFoods();
    } else {
      foods_provider.get_food_category(categ);
    }

    return Scaffold(
      // Se utiliza el FutureBuilder ya que la interfaz está a la espera de que la foodsList tega los datos de la consutal de la Api
      body: SafeArea(
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
              Categories(),
              SizedBox(
                height: 10,
              ),
              //Se crea el slider que contendrá algunas de las imagenes de de la comida del día
              Food_Slider(context: context, foodsList: foods_provider),
              SizedBox(
                height: 20,
              ),
              //Se crea la sección de todos las comidas
              Container(
                height: 300,
                color: backgraundApp,
                child: AllFoods(context: context, foodsList: foods_provider),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
