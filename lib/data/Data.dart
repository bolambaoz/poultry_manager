// ignore: file_names
// ignore_for_file: file_names

import 'package:poultry_to_list/data/model/daily_task.dart';
import 'package:poultry_to_list/data/model/egg_collection.dart';
import 'package:poultry_to_list/data/model/feeding.dart';
import 'package:poultry_to_list/data/model/watering.dart';

var eggCollection = EggCollection(
    numberOfEgg: 0,
    sizeXXL: 0,
    sizeXL: 0,
    sizeL: 0,
    sizeM: 0,
    sizeS: 0,
    sizeXS: 0);

var totalWaterInLiters = AppVar.numberOfHeads * 0.1;
var medicineGrams = (totalWaterInLiters / 4) * 5;
var feedsPerHeads = 115.0;

var watering = Watering(
    doximol: medicineGrams,
    premoxil: medicineGrams,
    sulforQr: medicineGrams,
    egg1000: medicineGrams,
    vitMenPro: medicineGrams);

var feeding = Feeding(
    feedsGrams: ((AppVar.numberOfHeads * feedsPerHeads) * 0.001),
    watering: watering);

class AppVar {
  static var numberOfHeads = 800.0;
  static var amountOfWater = numberOfHeads / 0.1;
  static var currentWeek = 4;
  static var currentDay = 1;
  static var startDate = null;
}
