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

class Slider_plan extends StatefulWidget {
  final List<ModelRandomFood> foodsList;
  const Slider_plan({super.key, required this.foodsList});
  @override
  State<Slider_plan> createState() => _Slider_planState();
}

class _Slider_planState extends State<Slider_plan> {
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
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Plan of the day",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
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
