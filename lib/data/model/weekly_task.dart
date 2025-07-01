// ignore: file_names
// ignore_for_file: file_names

import 'package:poultry_to_list/data/model/daily_task.dart';

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
