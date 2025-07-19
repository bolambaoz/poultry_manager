import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poultry_to_list/model/poultryisar.dart';

class PoultryDatabase {
  static late Isar isar;

  // INITIALIZE DATABASE

  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open(
      [Poultry],
      directory: dir.path,
    );
  }
}
