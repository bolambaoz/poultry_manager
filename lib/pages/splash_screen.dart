import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/data/model/daily_task.dart';
import 'package:poultry_to_list/data/model/feeding.dart';
import 'package:poultry_to_list/data/model/watering.dart';
import 'package:poultry_to_list/data/model/weekly_task.dart';
import 'package:poultry_to_list/views/dialog_builder.dart';
import 'package:poultry_to_list/views/poultry_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  List<WeeklyTask> weekTask = [];

  Watering initialWatering(int dayIndx) {
    Watering mixWater = Watering(
        doximol: 0, premoxil: 0, sulforQr: 0, egg1000: 0, vitMenPro: 0);
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

  Feeding setupFeedingPeriod(int weekIndx, int dayIndx) {
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

  void data() {
    var tempCount = 1;
    for (var i = 1; i <= 20; i++) {
      List<DailyTask> mtask = [];
      for (var j = 1; j <= 7; j++) {
        mtask.add(DailyTask(
            day: "Day $tempCount",
            feed: setupFeedingPeriod(i, j),
            eggCollection: eggCollection));
        tempCount++;
      }
      weekTask.add(WeeklyTask(
          numWeek: i,
          dailyTask: mtask,
          currentDay: AppVar.currentDay,
          currentWeek: AppVar.currentWeek));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "Poultry",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            PoultryList(),
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                dialogBuilder(context); //_dialogBuilder(context);
              },
              child: Text('Create Batch'),
            ),
            Container(
              child: SizedBox(
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
