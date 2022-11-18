import 'dart:html';

// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

import '../Models/model_products.dart';

class ImgDetails extends StatelessWidget {
  final ModelRandomFood product;

  const ImgDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: backgraundApp),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              child: ClipOval(
                child: Image.network(
                  product.imgURL,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
