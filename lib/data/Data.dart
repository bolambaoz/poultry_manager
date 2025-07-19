// ignore: file_names
// ignore_for_file: file_names

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
  static var startDate = "";
}

Feeding setupFeedingPeriod(
    int weekIndx, int dayIndx, num numberOfHeads, num feedsPerHeads) {
  var watering = Watering(
      doximol: medicineGrams,
      premoxil: medicineGrams,
      sulforQr: medicineGrams,
      egg1000: medicineGrams,
      vitMenPro: medicineGrams);

  var _feeding = Feeding(
      feedsGrams: ((AppVar.numberOfHeads * feedsPerHeads) * 0.001),
      watering: watering);

  _feeding.watering.doximol = 0;
  _feeding.watering.premoxil = 0;
  _feeding.watering.sulforQr = 0;
  _feeding.watering.egg1000 = 0;
  _feeding.watering.vitMenPro = 0;

  switch (weekIndx) {
    case 1:
      _feeding.watering = initialWatering(dayIndx);
    case 2:
      _feeding.watering = initialWatering(dayIndx);
    case 3:
      _feeding.watering = initialWatering(dayIndx);
    case 4:
      _feeding.watering = initialWatering(dayIndx);
    case 5:
      break;
    case 6:
      break;
    default:
      if (dayIndx == 6) {
        switch (dayIndx) {
          case 1:
            _feeding.watering.vitMenPro = medicineGrams;
          case 3:
            _feeding.watering.premoxil = medicineGrams;
          case 6:
            _feeding.watering.sulforQr = medicineGrams;
        }
      } else {
        _feeding.watering.vitMenPro = medicineGrams;
      }
  }
  return _feeding;
}

Watering initialWatering(int dayIndx) {
  Watering mixWater =
      Watering(doximol: 0, premoxil: 0, sulforQr: 0, egg1000: 0, vitMenPro: 0);
  switch (dayIndx) {
    case 1:
      mixWater.vitMenPro = medicineGrams;
    case 2:
      mixWater.doximol = medicineGrams;
    case 3:
      mixWater.vitMenPro = medicineGrams;
      mixWater.premoxil = medicineGrams;
    case 4:
      mixWater.vitMenPro = medicineGrams;
    case 5:
      mixWater.vitMenPro = medicineGrams;
    case 6:
      mixWater.sulforQr = medicineGrams;
    case 7:
      mixWater.vitMenPro = medicineGrams;
  }
  return mixWater;
}
