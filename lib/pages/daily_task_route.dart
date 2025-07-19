import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/data/model/daily_task.dart';
import 'package:poultry_to_list/views/egg_collector.dart';
import 'package:poultry_to_list/views/to_header_view.dart';

class DailyTaskRoute extends StatelessWidget {
  const DailyTaskRoute({super.key, required this.dailyTask, required this.day});

  final DailyTask dailyTask;
  final String day;

  String schedule(TimeOfDay time) {
    return "${time.hourOfPeriod}:0${time.minute}${time.period.name}";
  }

  List<Map<String, DailyTask>> listSched() {
    return [
      {
        "Feeding/watering ${schedule(TimeOfDay(hour: 6, minute: 0))}": dailyTask
      },
      {"Egg Collection ${schedule(TimeOfDay(hour: 8, minute: 0))}": dailyTask},
      {
        "Feeding/watering ${schedule(TimeOfDay(hour: 13, minute: 0))}":
            dailyTask
      },
      {"Egg Collection ${schedule(TimeOfDay(hour: 16, minute: 0))}": dailyTask},
      {
        "Feeding/watering ${schedule(TimeOfDay(hour: 19, minute: 0))}":
            dailyTask
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text("Daily Routine"),
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            ToHeaderView(
              day: day,
              task: listSched(),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: listSched().length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(12)),
                      child: ExpandableTask(index, listSched()),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  Widget ExpandableTask(int index, List<Map<String, DailyTask>> list) {
    var mTime = list.elementAt(index);

    if (mTime.entries.first.key.contains("Egg Collection")) {
      return EggCollector(mTime: mTime);
    } else {
      return FeedingView(mTime);
    }
  }

  ExpansionTile FeedingView(Map<String, DailyTask> mTime) {
    return ExpansionTile(
      shape: LinearBorder.none,
      collapsedShape: LinearBorder.none,
      childrenPadding: EdgeInsets.all(12).copyWith(top: 0),
      title: Text(
        mTime.entries.first.key,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        FeedingDropDownCell(
            (dailyTask.feed.feedsGrams / 3).toStringAsFixed(2), "Feed", "kilo"),
        FeedingDropDownCell(totalWaterInLiters.toString(), "Water", "liters"),
        Text(
          "Water Additives:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Visibility(
            visible: (dailyTask.feed.watering.doximol == 0 ||
                    !mTime.entries.first.key.contains("1:00pm"))
                ? false
                : true,
            child: FeedingDropDownCell(
                dailyTask.feed.watering.doximol.toString(),
                "Doximol",
                "grams")),
        Visibility(
            visible: (dailyTask.feed.watering.premoxil == 0 ||
                    !mTime.entries.first.key.contains("1:00pm"))
                ? false
                : true,
            child: FeedingDropDownCell(
                dailyTask.feed.watering.premoxil.toString(),
                "Premoxil",
                "grams")),
        Visibility(
            visible: (dailyTask.feed.watering.sulforQr == 0 ||
                    !mTime.entries.first.key.contains("1:00pm"))
                ? false
                : true,
            child: FeedingDropDownCell(
                dailyTask.feed.watering.sulforQr.toString(),
                "Sulfor-Qr",
                "grams")),
        Visibility(
            visible: (dailyTask.feed.watering.egg1000 == 0 ||
                    !mTime.entries.first.key.contains("7:00pm"))
                ? false
                : true,
            child: FeedingDropDownCell(
                dailyTask.feed.watering.egg1000.toString(),
                "Egg-1000",
                "grams")),
        Visibility(
            visible: (dailyTask.feed.watering.vitMenPro == 0 ||
                    !mTime.entries.first.key.contains("6:00am"))
                ? false
                : true,
            child: FeedingDropDownCell(
                dailyTask.feed.watering.vitMenPro.toString(),
                "VitMen-Pro",
                "grams")),
      ],
    );
  }

  Padding FeedingDropDownCell(String value, String taskName, String unit) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("$taskName: "), Text("$value $unit")],
        ));
  }
}
