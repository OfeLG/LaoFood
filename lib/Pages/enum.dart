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
List<ModelIngredients> Plan_day = [];
List<ModelIngredients> ingr_Basket = [];
List<String> list_search = [];

String previous_view = "";

final List<DateTime> dateList = [
  DateTime.now(),
  DateTime.now().add(const Duration(hours: 24)),
  DateTime.now().add(const Duration(hours: 48)),
  DateTime.now().add(const Duration(hours: 72)),
  DateTime.now().add(const Duration(hours: 96)),
  DateTime.now().add(const Duration(hours: 120)),
  DateTime.now().add(const Duration(hours: 144))
];
