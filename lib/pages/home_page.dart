import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/data/model/daily_task.dart';
import 'package:poultry_to_list/data/model/feeding.dart';
import 'package:poultry_to_list/data/model/watering.dart';
import 'package:poultry_to_list/data/model/weekly_task.dart';
import 'package:poultry_to_list/pages/daily_task_route.dart';
import 'package:poultry_to_list/views/todo_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void initState() {
    super.initState();
    setState(() {
      data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text("Poultry Manager"),
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 14, 8, 12),
          child: Column(
            children: [
              // SizedBox(
              //   height: 52,
              //   child: Center(
              //     child: Text(
              //       "WEEK ${AppVar.currentWeek}",
              //     ),
              //   ),
              // ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  children: List.generate(
                      weekTask[AppVar.currentWeek - 1].dailyTask.length,
                      (index) {
                    return InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DailyTaskRoute(
                                    dailyTask: weekTask[AppVar.currentWeek - 1]
                                        .dailyTask[index],
                                    day: weekTask[AppVar.currentWeek - 1]
                                        .dailyTask[index]
                                        .day,
                                  )),
                        )
                      },
                      child: TodoCell(
                        day: weekTask[AppVar.currentWeek - 1]
                            .dailyTask[index]
                            .day,
                      ),
                    );
                  }),
                ),
              ),
              FloatingActionButton.large(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Icon(Icons.edit_outlined),
              ),
            ],
          ),
        ));
  }
}
