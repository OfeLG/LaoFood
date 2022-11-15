// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Con el widget row se crea el appBar de la aplicación, para ubicar cada uno de los elementos uno al lado de otro
    return Row(
      //Se le añader un espacio entre cada uno de los elementos que tendrá el widget Row
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Se crea el primer elemento del appBar, en este caso el contendor tendrá un icono que desplegará un menú
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            //Se le asigna el color del contenedor del primer icono
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Builder(
            builder: (context) => IconButton(
              //Se agrega el primer icono que tendrá el appBar
              icon: Icon(
                Icons.menu,
                color: primaryColor,
                size: 30,
              ),
              //Se agrega la funcionalidad que tendrá dicho icono
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        //Se crea el segundo elemento que tendrá el appBar, en este caso es un column que tendra el tipo de app y el nombre de la app
        Column(
          children: [
            //Tipo de app (O sea en este caso es una app de subastas en linea)
            Text(
              "RECIPES",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            //Nombre de la App
            Text(
              "LoaFood",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        //Se crea el tercer elemento de appBar, el cual es la imagen del perfil del usuario
        Container(
          width: 60,
          height: 60,
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: AssetImage("assets/profile.jpg"),
              radius: 200.0),
        ),
      ],
    );
  }
}
