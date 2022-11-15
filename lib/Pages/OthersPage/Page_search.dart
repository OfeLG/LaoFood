// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';

class PageSearh extends StatefulWidget {
  @override
  State<PageSearh> createState() => _PageSearhState();
}

class _PageSearhState extends State<PageSearh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search recipes"),
      ),
      bottomNavigationBar: BottomNavBar(), //TEMPORAL
    );
  }
}
