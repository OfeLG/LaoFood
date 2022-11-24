// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/SearchPages/searchBar_food.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

class PageSearch extends StatefulWidget {
  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
          ],
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
