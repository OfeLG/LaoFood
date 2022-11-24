// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/Basket_pages/searchBar_ingredients.dart';
import 'package:loafood/Pages/Basket_pages/body_mybasket.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

class MyBasket extends StatefulWidget {
  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            SearchBar_Ingr(),
            SizedBox(height: 10),
            Body_MyBasket(),
          ],
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
