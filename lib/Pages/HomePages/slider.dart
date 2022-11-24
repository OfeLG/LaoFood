// Se importa el paquete material.dart
import 'dart:html';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:loafood/constants.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Widgets/carousel_Widget.dart';

class Food_Slider extends StatefulWidget {
  final List<ModelRandomFood> foodsList;
  const Food_Slider({super.key, required this.foodsList});
  @override
  State<Food_Slider> createState() => _Food_SliderState();
}

class _Food_SliderState extends State<Food_Slider> {
  @override
  Widget build(BuildContext context) {
    //Se crea el contenedor que tendrá al Slider
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 255,
        color: backgraundApp,
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
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 242, //Se define una altura al contenedor
              child: CarouselSlider.builder(
                slideBuilder: (index) {
                  return Widget_Carousel(widget.foodsList)[index];
                },
                itemCount: Widget_Carousel(widget.foodsList).length,
                enableAutoSlider: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
