// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/home.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Widgets/foots_Widget.dart';
import 'package:loafood/Widgets/img_details.dart';
import 'package:loafood/Models/model_foots.dart';

import '../../Widgets/info_details.dart';
import '../bottomNavBar.dart';

class Details extends StatelessWidget {
  //Se recibirá un objeto de tipo ModelRandomFood para mostrar los datos da la comida seleccionada
  final ModelRandomFood foot;
  Details(this.foot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 38,
                    height: 38,
                    padding: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      //Se le asigna el color del contenedor del primer icono
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Builder(
                      builder: (context) => IconButton(
                        //Se agrega el primer icono que tendrá el appBar
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: secondaryColor,
                          size: 24,
                        ),
                        //Se agrega la funcionalidad que tendrá dicho icono
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.only(right: 5),
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      //Se le asigna el color del contenedor del primer icono
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Builder(
                      builder: (context) => IconButton(
                        //Se agrega el primer icono que tendrá el appBar
                        icon: Icon(
                          Icons.favorite_outline,
                          color: secondaryColor,
                          size: 24,
                        ),
                        //Se agrega la funcionalidad que tendrá dicho icono
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ImgDetails(foot: foot),
            InfoDetails(foot: foot),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 80,
        height: 46,
        child: RawMaterialButton(
          fillColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.group,
                color: Colors.white,
                size: 25,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ), //Añadir cantidad de personas a comer
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: BottomNavBar(), //TEMPORAL
    );
  }
}

/*
Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
*/