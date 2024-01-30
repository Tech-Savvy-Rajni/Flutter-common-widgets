

import 'package:hive/hive.dart';

import 'hive_box_keys.dart';

void saveCartAlcoholQuantityCheckMap(Map<int,int>? map) async {
  final box =  Hive.box(HiveBoxKeys.alcoholCheckBox);// Open a Hive box (or create if it doesn't exist)
  await box.put(HiveKeys.hiveAlcohol, map); // Save the Map using a unique key
}


// Future<Map<int, int>?> retrieveCartAlcoholQuantityCheckMap() async {
//   final box = Hive.box(HiveBoxKeys.alcoholCheckBox);
//   final myMap = box.get(HiveKeys.hiveAlcohol);
//   return myMap; // Do something with the retrieved Map
//
// }


// Future<Map<int, int>?> retrieveCartAlcoholQuantityCheckMap() async {
//   final box = Hive.box(HiveBoxKeys.alcoholCheckBox);
//   final myMap = box.get(HiveKeys.hiveAlcohol) as Map<int, int>?; // Cast the value to the correct type
//   return myMap; // Return the casted value
// }

Future<Map<int, int>?> retrieveCartAlcoholQuantityCheckMap() async {
  final box = Hive.box(HiveBoxKeys.alcoholCheckBox);
  final myMap = box.get(HiveKeys.hiveAlcohol)?.cast<int, int>();
  return myMap;
}

