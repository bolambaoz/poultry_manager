import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/data/model/daily_task.dart';

class ToHeaderView extends StatelessWidget {
  const ToHeaderView({
    super.key,
    required this.day,
    required this.task,
  });

  final String day;
  final List<Map<String, DailyTask>> task;

  String checkLatesTask() {
    var time = TimeOfDay.now();
    var latestTask = "";
    //loop to all task to check the current task or the upcoming;
    for (var item in task) {
      if (latestTask.isNotEmpty) {
        break;
      }
      var mhours = item.entries.first.key.split(' ').last;

      if ((time.hourOfPeriod <= int.parse(mhours[0]) &&
          mhours.contains(time.period.name.toString()))) {
        latestTask = item.entries.first.key;
      }
    }

    return latestTask;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(checkLatesTask())
          ],
        ),
      ),
    ));
  }
}
