import 'package:get/get.dart';
// Se importan un del proyecto que tienen relación con esta pagina
import 'package:loafood/Models/model_foods.dart';
import 'package:loafood/Models/model_ingredients.dart';

class BottomBarController extends GetxController {
  var _selectedIndex = 0.obs;
  getIndex() => _selectedIndex.value;
  setIndex(val) => _selectedIndex.value = val;
}

List<ModelRandomFood> favoriteList =
    []; //Se crea una lista vacia en la que se ingresaran los datos de los productos favoritos
List<ModelIngredients> ingr_Basket = [];
