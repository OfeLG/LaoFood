// Se importa el paquete material.dart
import 'dart:js';

import 'package:loafood/Pages/enum.dart';
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/HomePages/homeBody.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/Pages/HomePages/home.dart';

// Se crea un widget con estado (Statefull) ya que tendremos una app con interfaz dinámica
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgraundApp, //Se le asigna el color que tendrá en fondo de la app
      //Con el fin de tener el codigo mas corto y organizado, en otro documento se creó el body (Se llama a HomeBody)
      //Se crea todo el contido que tendrá la app
      body: HomeBody(),
      //Se crea la barra de opciones
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
