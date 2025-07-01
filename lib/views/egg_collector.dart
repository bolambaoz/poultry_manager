import 'package:flutter/material.dart';
import 'package:poultry_to_list/data/Data.dart';
import 'package:poultry_to_list/data/model/daily_task.dart';

class EggCollector extends StatelessWidget {
  const EggCollector({
    super.key,
    required this.mTime,
  });

  final Map<String, DailyTask> mTime;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: LinearBorder.none,
      collapsedShape: LinearBorder.none,
      childrenPadding: EdgeInsets.all(12).copyWith(top: 0),
      title: Text(
        mTime.entries.first
            .key, //${mTime.entries.first.value.hourOfPeriod}:0${mTime.entries.first.value.minute}${mTime.entries.first.value.period.name}",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [Text("collection egg")],
    );
  }
}
