import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tu_cancha/src/data/models/scheduling_model.dart';

late final Isar dbInstance;

Future<void> initDb() async {
  final dir = await getApplicationDocumentsDirectory();
  dbInstance = await Isar.open(
    [SchedulingModelSchema],
    directory: dir.path,
  );
}
