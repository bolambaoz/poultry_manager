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
var medicineGrams = (totalWaterInLiters / 5) * 5;
var feedsPerHeads = 115.0;

var watering = Watering(
    doximol: medicineGrams,
    premoxil: medicineGrams,
    sulforQr: medicineGrams,
    egg1000: medicineGrams,
    vitMenPro: medicineGrams);

var feeding = Feeding(
    feedsGrams: ((AppVar.numberOfHeads * feedsPerHeads) * 0.001) / 50.0,
    watering: watering);

class AppVar {
  static var numberOfHeads = 800.0;
  static var amountOfWater = numberOfHeads / 0.1;
  static var currentWeek = 1;
  static var currentDay = 1;
}

class WeeklyTask {
  final int numWeek;
  final int currentDay;
  final int currentWeek;
  final List<DailyTask> dailyTask;

  WeeklyTask({
    required this.numWeek,
    required this.currentDay,
    required this.currentWeek,
    required this.dailyTask,
  });
}

class DailyTask {
  final String day;
  final Feeding f1;
  final Feeding f2;
  final Feeding f3;
  final EggCollection egg1;
  final EggCollection egg2;

  //List<Track> tracks;

  DailyTask({
    required this.day,
    required this.f1,
    required this.f2,
    required this.f3,
    required this.egg1,
    required this.egg2,
    // this.tracks,
  });
}

class Feeding {
  final num feedsGrams;
  final Watering watering;

  Feeding({
    required this.feedsGrams,
    required this.watering,
  });
}

class Watering {
  final num doximol;
  final num premoxil;
  final num sulforQr;
  final num egg1000;
  final num vitMenPro;

  Watering({
    required this.doximol,
    required this.premoxil,
    required this.sulforQr,
    required this.egg1000,
    required this.vitMenPro,
  });
}

class EggCollection {
  final int numberOfEgg;
  final int sizeXXL;
  final int sizeXL;
  final int sizeL;
  final int sizeM;
  final int sizeS;
  final int sizeXS;

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
