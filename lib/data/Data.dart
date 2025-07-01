// ignore: file_names
// ignore_for_file: file_names

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

class WeeklyTask {
  int numWeek;
  int currentDay;
  int currentWeek;
  List<DailyTask> dailyTask;

  WeeklyTask({
    required this.numWeek,
    required this.currentDay,
    required this.currentWeek,
    required this.dailyTask,
  });
}

class DailyTask {
  String day;
  Feeding feed;
  EggCollection eggCollection;

  //List<Track> tracks;

  DailyTask({
    required this.day,
    required this.feed,
    required this.eggCollection,
    // this.tracks,
  });
}

class Feeding {
  num feedsGrams;
  Watering watering;

  Feeding({
    required this.feedsGrams,
    required this.watering,
  });
}

class Watering {
  num doximol;
  num premoxil;
  num sulforQr;
  num egg1000;
  num vitMenPro;

  Watering({
    required this.doximol,
    required this.premoxil,
    required this.sulforQr,
    required this.egg1000,
    required this.vitMenPro,
  });
}

class EggCollection {
  int numberOfEgg;
  int sizeXXL;
  int sizeXL;
  int sizeL;
  int sizeM;
  int sizeS;
  int sizeXS;

  EggCollection({
    required this.numberOfEgg,
    required this.sizeXXL,
    required this.sizeXL,
    required this.sizeL,
    required this.sizeM,
    required this.sizeS,
    required this.sizeXS,
  });
}
