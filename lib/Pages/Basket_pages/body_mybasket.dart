import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loafood/Models/model_ingredients.dart';
import 'package:loafood/Pages/Basket_pages/body_search_myBasket.dart';
import 'package:loafood/Pages/Basket_pages/myBasket.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Widgets/ingredient_Widget.dart';
import 'package:loafood/constants.dart';

class Body_MyBasket extends StatefulWidget {
  @override
  State<Body_MyBasket> createState() => _Body_MyBasketState();
}

class _Body_MyBasketState extends State<Body_MyBasket> {
  bool isLike = false;
  final Color inactiveColor = Colors.black.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ingr_Basket.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                Icon(
                  Icons.shopping_basket,
                  color: secondaryColor.withOpacity(0.2),
                  size: 70,
                ),
                ListTile(
                  title: Text(
                    "EMPTY BASKET",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: primaryColor.withOpacity(0.2)),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "To add ingredients use the seacrh engine",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor.withOpacity(0.2)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          : Container(
              width: double.infinity,
              height: 600,
              child: GridView.builder(
                itemCount: ingr_Basket.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.88, //0.70
                ),
                itemBuilder: (BuildContext context, index) {
                  //Sele asignan los datos
                  return Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Ingredient_Widget(
                              ingr_Basket[index], double.infinity, 175, 120),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          padding: EdgeInsets.only(right: 42, top: 16),
                          //Se indica la acción que tendrá el icono en caso de darle click
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                            });
                            ingr_Basket.remove(ingr_Basket[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBasket()),
                            );
                          },
                          //Se le asigna el icono
                          icon: Icon(
                            isLike
                                ? Icons.disabled_by_default
                                : Icons.disabled_by_default_outlined,
                            color: isLike ? secondaryColor : inactiveColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}



/*

child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 100,
                      color: Colors.red,
                      child: Text(
                        snapshot.data!.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),








 if (ingr_basket.length == 0) {
              return  Container(
                child: ListTile(
                  title: Text("EMPTY BASKET",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: primaryColor.withOpacity(0.1)),
                      textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "To add an ingredient, use the search engine",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor.withOpacity(0.1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else if (ingr_basket.length > 0) {
              return Container();
            }


*/