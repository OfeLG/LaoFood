// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

class MyPlan extends StatefulWidget {
  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Text(
              "My weekly plan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                for (var item in dateList) {
                  print(item);
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: secondaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  side: BorderSide(
                    width: 3.0,
                    color: secondaryColor,
                  ),
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(
                    fontSize: 20,
                  )),
              child: Text(
                "PROBAR",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
