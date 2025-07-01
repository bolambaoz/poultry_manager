// ignore: file_names
// ignore_for_file: file_names

import 'package:poultry_to_list/data/model/egg_collection.dart';
import 'package:poultry_to_list/data/model/feeding.dart';

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
