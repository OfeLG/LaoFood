// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Widgets/products_Widget.dart';
import 'package:loafood/Models/model_products.dart';

import '../bottomNavBar.dart';

class Details extends StatefulWidget {
  //Se recibirá un objeto de tipo ModelRandomFood para mostrar los datos del producto seleccionado
  final ModelRandomFood product;

  const Details({super.key, required this.product});
  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  //Se crean dos variables para llevar el control del icono favorito que tienen los contendores de los productos
  bool isLike = false;
  final Color inactiveColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información del producto"),
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