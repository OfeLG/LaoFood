import 'dart:html';

// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import '../Models/model_foods.dart';
import '../Provider/foods_provider_Str.dart';

class ImgDetails extends StatefulWidget {
  final BuildContext context;
  final Foods_Provider_Str foodsList;
  const ImgDetails({super.key, required this.context, required this.foodsList});

  @override
  State<ImgDetails> createState() => _ImgDetailsState();
}

class _ImgDetailsState extends State<ImgDetails> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.foodsList.FoodsStream_id,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
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
                    width: 228,
                    height: 350,
                    margin: EdgeInsets.all(15),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(-1, 10),
                        blurRadius: 10,
                      ),
                    ]),
                    child: ClipOval(
                      child: Image.network(
                        (snapshot.data as List<ModelFoodId>)[0].imgURL,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          print(snapshot.error);
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
