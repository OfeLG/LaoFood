import 'dart:html';

// Se importa el paquete material.dart
import 'package:flutter/material.dart';
import 'package:loafood/Pages/FavoritesPages/favoritePage.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import 'package:loafood/Pages/HomePages/slider.dart';
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/DetailsPages/food_details.dart';
import 'package:loafood/Provider/foods_provider_Str.dart';

class AllFoods extends StatelessWidget {
  final BuildContext context;
  final Foods_Provider_Str foodsList;
  const AllFoods({super.key, required this.context, required this.foodsList});
  @override
  Widget build(BuildContext context) {
    //Se crea la cuadricula de cuantas columnas se desea mostrar
    return StreamBuilder(
      stream: foodsList.FoodsStream,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: (snapshot.data as List<ModelRandomFood>).length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (BuildContext context, index) {
              //Sele asignan los datos
              return AllSingleProducts(
                foodsList: (snapshot.data as List<ModelRandomFood>)[index],
              );
            },
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

//Se crea una clase que contendrá los productos de forma individual
class AllSingleProducts extends StatefulWidget {
  final ModelRandomFood foodsList;
  const AllSingleProducts({super.key, required this.foodsList});
  @override
  State<AllSingleProducts> createState() => _AllSingleProducts();
}

class _AllSingleProducts extends State<AllSingleProducts> {
  //Se crean dos variables para llevar el control del icono favorito que tienen los contendores de los productos
  bool isLike = false;
  final Color inactiveColor = Colors.black38;

  @override
  Widget build(BuildContext context) {
    //Se retorna un GestureDetector con un onTap con el fin de llamar a Details, que es otra pagina donde se detallan los datos del producto seleccionado
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(food: widget.foodsList)),
        );
      },
      child: Column(
        children: [
          //Se crea el contenedor que tendrá cada imagen
          Container(
            height: 100,
            width: 160,
            child: Stack(
              //Se usa el stack para que dos widgets se sobrepongan (en este caso, el container del favorite encima de la imagen)
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.foodsList.imgURL,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    //Se indica la acción que tendrá el icono en caso de darle click
                    onPressed: () {
                      setState(() {
                        isLike = !isLike;
                      });
                      if (favoriteList.length == 0) {
                        favoriteList.add(widget.foodsList);
                      } else {
                        if (favoriteList.contains(widget.foodsList)) {
                          int index = favoriteList.indexOf(widget
                              .foodsList); // Me retorna el indice donde se encuentra
                          favoriteList.removeAt(index);
                        } else {
                          favoriteList.add(widget.foodsList);
                        }
                      }
                    },
                    //Se le asigna el icono
                    icon: Icon(
                      isLike ? Icons.favorite : Icons.favorite_border_outlined,
                      color: isLike ? secondaryColor : inactiveColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ), //Se le asigna la imagen
          ),
          // Se crea un listTile que contenga el nombre, la descripción y el icono de favorito
          Container(
            width: 190,
            height: 80,
            child: ListTile(
              title: Text((widget.foodsList.name.length > 20)
                  ? widget.foodsList.name.substring(0, 20)
                  : widget.foodsList.name + "..."),
              subtitle: Text(
                "${widget.foodsList.category}",
                style: TextStyle(fontSize: 15.0, color: primaryColor),
              ), //para que puestre solo 20 caracteres de la descripción
              //Se usa el widget trailing para crear la opción de favorito que tendrá la app
            ),
          ),
          Container(
            height: 30,
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 78,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color: primaryColor,
                        style: BorderStyle.solid),
                  ),
                  child: _buildIconText(
                    Icons.access_time_outlined,
                    Colors.white,
                    "${widget.foodsList.time.toString()} M",
                  ),
                ),
                Container(
                  width: 78,
                  height: 30,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color: primaryColor,
                        style: BorderStyle.solid),
                  ),
                  child: _buildIconText(
                    Icons.local_fire_department_outlined,
                    Colors.white,
                    (widget.foodsList.calories.toString().length > 4)
                        ? widget.foodsList.calories.toString().substring(0, 4)
                        : widget.foodsList.calories.toString(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        )
      ],
    );
  }
}
