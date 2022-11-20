// Se importa el paquete material.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import '../Models/model_products.dart';

List mientras = [
  "hora",
  "Noche",
  "Dia",
  "mañana",
  "ven",
  "vamos",
];

//Se crea un stateless con el fin de plasmar la información del producto seleccionado
class InfoDetails extends StatelessWidget {
  //Creamos una variable que tendrá la información
  final ModelRandomFood product;
  const InfoDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: backgraundApp,
      child: Column(children: [
        Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconText(
              Icons.access_time_outlined,
              primaryColor,
              product.time.toString(),
            ),
            _buildIconText(
              Icons.local_fire_department_outlined,
              primaryColor,
              (product.calories.toString().length > 4)
                  ? product.calories.toString().substring(0, 4)
                  : product.calories.toString(),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.maxFinite,
          height: 40,
          color: backgraundApp,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.only(left: 20, right: 18, top: 4),
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: double.maxFinite,
                  padding: EdgeInsets.only(left: 20, right: 18, top: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          child: Text(
            "Ingredients",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        child: Image.network(
                          product.imgURL,
                          width: 52,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(mientras[index]),
                    ]),
                  ),
              separatorBuilder: (_, index) => SizedBox(width: 15),
              itemCount: mientras.length),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          child: Text(
            "Recipe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "hola bebe que mas pues te estoy llamando porque necesito mas de ti, hay algo de tu voz que me seduce y me hace sentir",
          style: TextStyle(
            wordSpacing: 1.2,
            height: 1.5,
            fontSize: 16,
          ),
        ), // Colocar la descripción
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            icon,
            color: color,
            size: 25,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 19,
          ),
        )
      ],
    );
  }
}
