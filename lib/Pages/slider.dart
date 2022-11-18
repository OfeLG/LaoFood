// Se importa el paquete material.dart
import 'dart:html';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:loafood/constants.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:loafood/Models/model_products.dart';
import 'package:loafood/Widgets/carousel_Widget.dart';

class Product_Slider extends StatefulWidget {
  final List<ModelRandomFood> productsList;
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
        height: 255,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                "Plan semanal",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 242, //Se define una altura al contenedor
              child: CarouselSlider.builder(
                slideBuilder: (index) {
                  return Widget_Carousel(widget.productsList)[index];
                },
                itemCount: Widget_Carousel(widget.productsList).length,
                enableAutoSlider: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
