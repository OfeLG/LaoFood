// Se importa el paquete material.dart
import 'package:loafood/constants.dart';
import 'package:flutter/material.dart';

//Se importa el archivo home que contiene la clase Home.
import 'package:loafood/Pages/HomePages/home.dart';
import 'package:loafood/constants.dart';

//Se crea un widget sin estado (Stateles) ya que este será estatico.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Se elimina el widget de Banner que viene integrado con la app de flutter
      debugShowCheckedModeBanner:
          false, //Por defecto es true por eso se configuró en false
      title: "LoaFood",
      theme: ThemeData(appBarTheme: AppBarTheme(color: primaryColor)),
      initialRoute: "/",
      routes: {"/": (BuildContext context) => Home()},
    );
  }
}
