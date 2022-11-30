// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:loafood/Pages/PlanPages/slider_plan.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

import '../../Models/model_foods.dart';
import '../../Provider/foods_provider.dart';
import 'card_plan.dart';

class MyPlan extends StatefulWidget {
  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  //Se declara una lista de tipo ModelFoods con future, ya que se esperará a que Foods_List sea llenada con datos
  late Future<List<List<ModelRandomFood>>> planList;

  @override
  void initState() {
    previous_view = "MyPlan";
    //foodsList es una instancia de la clase Foods_Provider
    planList = Foods_Provider()
        .get_plan(); //Se llama al metodo getFoods de esa clase para obtener los datos de la Api
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se utiliza el FutureBuilder ya que la interfaz está a la espera de que la foodsList tega los datos de la consutal de la Api
      body: FutureBuilder<List<List<ModelRandomFood>>>(
          future: planList,
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
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "My weekly plan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: secondaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Slider_plan(foodsList: [
                        snapshot.data![0][0],
                        snapshot.data![1][0],
                        snapshot.data![2][0]
                      ]),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Plan: " +
                                  dateList[1].day.toString() +
                                  "-" +
                                  dateList[1].month.toString() +
                                  "-" +
                                  dateList[1].year.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: previous_view == "HomeBody"
                                  ? TextAlign.center
                                  : TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 205, //Se define una altura al contenedor
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, posicion) {
                                return Card_plan(
                                    food: snapshot.data![posicion][1]);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Plan: " +
                                  dateList[2].day.toString() +
                                  "-" +
                                  dateList[2].month.toString() +
                                  "-" +
                                  dateList[2].year.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: previous_view == "HomeBody"
                                  ? TextAlign.center
                                  : TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 205, //Se define una altura al contenedor
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, posicion) {
                                return Card_plan(
                                    food: snapshot.data![posicion][2]);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Plan: " +
                                  dateList[3].day.toString() +
                                  "-" +
                                  dateList[3].month.toString() +
                                  "-" +
                                  dateList[3].year.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: previous_view == "HomeBody"
                                  ? TextAlign.center
                                  : TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 205, //Se define una altura al contenedor
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, posicion) {
                                return Card_plan(
                                    food: snapshot.data![posicion][3]);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Plan: " +
                                  dateList[4].day.toString() +
                                  "-" +
                                  dateList[4].month.toString() +
                                  "-" +
                                  dateList[4].year.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: previous_view == "HomeBody"
                                  ? TextAlign.center
                                  : TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 205, //Se define una altura al contenedor
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, posicion) {
                                return Card_plan(
                                    food: snapshot.data![posicion][4]);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Plan: " +
                                  dateList[5].day.toString() +
                                  "-" +
                                  dateList[5].month.toString() +
                                  "-" +
                                  dateList[5].year.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: previous_view == "HomeBody"
                                  ? TextAlign.center
                                  : TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 205, //Se define una altura al contenedor
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, posicion) {
                                return Card_plan(
                                    food: snapshot.data![posicion][5]);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 9),
                            child: Text(
                              "Plan: " +
                                  dateList[6].day.toString() +
                                  "-" +
                                  dateList[6].month.toString() +
                                  "-" +
                                  dateList[6].year.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: previous_view == "HomeBody"
                                  ? TextAlign.center
                                  : TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 205, //Se define una altura al contenedor
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, posicion) {
                                return Card_plan(
                                    food: snapshot.data![posicion][6]);
                              },
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
          }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
