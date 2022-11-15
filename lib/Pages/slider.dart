// Se importa el paquete material.dart
import 'package:loafood/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:loafood/Models/model_products.dart';
import 'package:loafood/Widgets/carousel_Widget.dart';

class Product_Slider extends StatefulWidget {
  final List<ModelProducts> productsList;
  const Product_Slider({super.key, required this.productsList});
  @override
  State<Product_Slider> createState() => _Product_SliderState();
}

class _Product_SliderState extends State<Product_Slider> {
  @override
  Widget build(BuildContext context) {
    //Se crea el contenedor que tendrá al Slider
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 240,
        child: Column(
          children: [
            Text(
              "Plan semanal",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200, //Se define una altura al contenedor
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Carousel(
                images: Widget_Carousel(widget.productsList),
                //Se añade animación al carousel
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(
                  milliseconds: 800,
                ),
                radius: Radius.circular(30),
                //Poner transparente la sección de los puntos del carousel
                dotBgColor: Colors.transparent,
                //Que el punto de la imagen mostrada cambie de color
                dotIncreasedColor: backgraundApp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
