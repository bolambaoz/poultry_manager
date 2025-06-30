import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/views/todo_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeeklyTask> weekTask = [];

  void data() {
    var tempCount = 1;
    for (var i = 1; i <= 20; i++) {
      List<DailyTask> mtask = [];
      for (var j = 1; j <= 7; j++) {
        mtask.add(DailyTask(
            day: "Day $tempCount",
            f1: feeding,
            f2: feeding,
            f3: feeding,
            egg1: eggCollection,
            egg2: eggCollection));
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
        body: Column(
          children: [
            SizedBox(
              height: 52,
              child: Center(
                child: Text(
                  "WEEK ${AppVar.currentWeek}",
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: List.generate(
                    weekTask[AppVar.currentWeek - 1].dailyTask.length, (index) {
                  return TodoCell(
                    day: weekTask[AppVar.currentWeek - 1]
                        .dailyTask[index]
                        .f1
                        .feedsGrams
                        .toString(),
                  );
                }),
              ),
            )
          ],
        ));
  }
}
