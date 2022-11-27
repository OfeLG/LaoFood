// Se importa el paquete material.dart
import 'dart:html';

import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:loafood/Pages/HomePages/all_foods.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/constants.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Widgets/main_carousel_Widget.dart';

import '../DetailsPages/food_details.dart';

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
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 255,
        color: backgraundApp,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: previous_view == "HomeBody" ? 0 : 5),
              child: Text(
                previous_view == "HomeBody"
                    ? "LoaFood offers you a plan"
                    : "Plan of the day",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: previous_view == "HomeBody"
                    ? TextAlign.center
                    : TextAlign.left,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 242, //Se define una altura al contenedor
              child: CarouselSlider.builder(
                slideBuilder: (index) {
                  return GestureDetector(
                      onTap: () {
                        ID = widget.foodsList[index].id;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Widget_Carousel(widget.foodsList)[index]);
                },
                itemCount: Widget_Carousel(widget.foodsList).length,
                enableAutoSlider: true,
                unlimitedMode: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
