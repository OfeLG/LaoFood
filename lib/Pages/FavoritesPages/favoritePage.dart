// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/Pages/enum.dart';
import 'package:loafood/Pages/bottomNavBar.dart';
import 'package:loafood/constants.dart';

import '../DetailsPages/food_details.dart';
import '../HomePages/all_foods.dart';

//Pagina donde se muestran las comidas favoritos
class Favorite extends StatefulWidget {
  const Favorite({super.key});
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  //Se crean dos variables para llevar el control del icono favorito que tienen los contendores de los productos
  bool isLike = true;
  final Color inactiveColor = Colors.black38;

  @override
  void initState() {
    previous_view = "Favorite";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Favorite recipes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ingr_Basket.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Icon(
                      Icons.favorite_outlined,
                      color: secondaryColor.withOpacity(0.2),
                      size: 70,
                    ),
                    ListTile(
                      title: Text(
                        "NO FAVORITE RECIPES",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: primaryColor.withOpacity(0.2)),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "To add recipes click on the icon i love it",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor.withOpacity(0.2)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 600,
            padding: EdgeInsets.only(right: 10, left: 10),
            child: GridView.builder(
                itemCount: favoriteList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70, //0.70
                ),
                itemBuilder: (BuildContext context, index) {
                  //Sele asignan los datos
                  return GestureDetector(
                    onTap: () {
                      ID = favoriteList[index].id;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details()),
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
                                      favoriteList[index].imgURL,
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
                                    favoriteList.remove(favoriteList[index]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Favorite()),
                                    );
                                  },
                                  //Se le asigna el icono
                                  icon: Icon(
                                    isLike
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color:
                                        isLike ? secondaryColor : inactiveColor,
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
                            title: Text((favoriteList[index].name.length > 20)
                                ? favoriteList[index].name.substring(0, 20)
                                : favoriteList[index].name + "..."),
                            subtitle: Text(
                              "${favoriteList[index].category}",
                              style: TextStyle(
                                  fontSize: 15.0, color: primaryColor),
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
                                  favoriteList[index].time.toString(),
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
                                  (favoriteList[index]
                                              .calories
                                              .toString()
                                              .length >
                                          4)
                                      ? favoriteList[index]
                                          .calories
                                          .toString()
                                          .substring(0, 4)
                                      : favoriteList[index].calories.toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
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
