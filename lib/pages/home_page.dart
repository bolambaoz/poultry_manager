import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/data/model/daily_task.dart';
import 'package:poultry_to_list/data/model/weekly_task.dart';
import 'package:poultry_to_list/pages/daily_task_route.dart';
import 'package:poultry_to_list/views/todo_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<WeeklyTask> weekTask = [];
  List<DailyTask> mtask = [];
  // late num numberOfHeads;
  // late num feedsPerHeads;
  // late int currentDay;
  // late int currentWeek;

  void data() {
    var tempCount = 1;
    for (var i = 1; i <= 20; i++) {
      // List<DailyTask> mtask = [];
      for (var j = 1; j <= 7; j++) {
        mtask.add(DailyTask(
            day: "Day $tempCount",
            feed: setupFeedingPeriod(i, j, AppVar.numberOfHeads, feedsPerHeads),
            eggCollection: eggCollection));
        tempCount++;
      }
      //   weekTask.add(WeeklyTask(
      //       numWeek: i,
      //       dailyTask: mtask,
      //       currentDay: AppVar.currentDay, //AppVar.currentDay,
      //       currentWeek: AppVar.currentWeek)); //AppVar.currentWeek));
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
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7;
    final double itemWidth = size.width / 7;

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
              height: (size.height - kToolbarHeight - 24) / 3.5,
              child: Center(
                child: Text(
                  "WEEK ${AppVar.currentWeek}",
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                children: List.generate(mtask.length, (index) {
                  //weekTask[AppVar.currentWeek - 1].dailyTask.length, (index) {
                  return InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DailyTaskRoute(
                                  dailyTask: mtask[index],
                                  day: mtask[index].day,
                                  // dailyTask: weekTask[AppVar.currentWeek - 1]
                                  //     .dailyTask[index],
                                  // day: weekTask[AppVar.currentWeek - 1]
                                  //     .dailyTask[index]
                                  //     .day,
                                )),
                      )
                    },
                    child: TodoCell(
                      day: mtask[index]
                          .day, //weekTask[AppVar.currentWeek - 1].dailyTask[index].day,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 5),
            FloatingActionButton(
              foregroundColor: Colors.amberAccent,
              backgroundColor: Colors.blue,
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Icon(Icons.edit_outlined),
            ),
            const SizedBox(height: 8),
          ],
        ));
  }
}
