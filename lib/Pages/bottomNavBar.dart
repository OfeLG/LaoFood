// Se importa el paquete material.dart
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:flutter/material.dart';
import 'package:loafood/Pages/SearchPages/Page_search.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/HomePages/home.dart';
import 'package:loafood/Pages/FavoritesPages/favoritePage.dart';
import 'package:loafood/Pages/PlanPages/myPlan.dart';

import 'Basket_pages/myBasket.dart';

var iconList = [
  Icons.home,
  Icons.search,
  Icons.shopping_basket,
  Icons.favorite
];
final controller = Get.put(BottomBarController());

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor = Colors.grey;

    return Container(
      height: 50,
      child: Scaffold(
        backgroundColor: backgraundApp,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.restaurant,
            color: primaryColor,
          ),
          backgroundColor: secondaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPlan()),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          borderColor: primaryColor,
          backgroundColor: Colors.white,
          inactiveColor: Colors.orange.shade100,
          activeColor: secondaryColor,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          icons: iconList,
          activeIndex: controller.getIndex(),
          onTap: (index) {
            controller.setIndex(index);
            if (controller.getIndex() == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            } else if (controller.getIndex() == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageSearch()),
              );
            } else if (controller.getIndex() == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBasket()),
              );
            } else if (controller.getIndex() == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorite()),
              );
            }
          },
        ),
      ),
    );
  }
}
