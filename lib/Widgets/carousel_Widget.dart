import 'dart:convert';
import 'dart:html';
// Se importa la libreria carousel_pro.dart con el fin de usar las propiedades de carousel
import 'package:carousel_pro/carousel_pro.dart';

// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Models/model_products.dart';

List<Widget> Widget_Carousel(List<ModelProducts> data) {
  //products se crea para agregar en él la lista de widgets (en este caso serán imagenes las que se agregarán)
  List<Widget> products = [];
  int cont = 0;
  for (var product in data) {
    //Se recorre la lista (data) qcon el fin de ir agregando uno a uno sus elementos a un widget Image
    products.add(Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "TIRULO DE LA RECETA",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Categoria",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 160,
                    child: FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: secondaryColor,
                      child: Text(
                        "Ver mi plan",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Image.network(
                product.imgURL,
              ),
            ),
          ),
        ],
      ),
    ));
    if (cont == 10) {
      break;
    }
    cont++;
  }
  return (products);
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(80, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/*
products.add(
      Image.network(product.imgURL),
    );
*/
