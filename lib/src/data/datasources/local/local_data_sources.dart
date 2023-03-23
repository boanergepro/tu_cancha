import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:tu_cancha/src/data/datasources/remote/remote_data_sources.dart';
import 'package:tu_cancha/src/data/models/scheduling_model.dart';

abstract class LocalDataSources {
  Future<List<SchedulingModel>> getScheduling();

  Future<SchedulingModel?> getSchedulingById(int id);

  Future<int> saveScheduling(SchedulingModel fieldModel);

  Future<bool> deleteScheduling(int id);
}

class LocalDataSourcesImpl implements LocalDataSources {
  final Isar? instance;

  LocalDataSourcesImpl({required this.instance});

  @override
  Future<List<SchedulingModel>> getScheduling() async {
    try {
      if (instance != null) {

        final isar = instance;

        List<SchedulingModel>? fields = await isar?.schedulingModels.where().findAll();
        // order fields by date
        fields?.sort((a, b) => a.scheduledDay.compareTo(b.scheduledDay));

        return fields!;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<SchedulingModel?> getSchedulingById(int id) async {
    try {
      if (instance != null) {
        final isar = instance;

        final field = await isar?.schedulingModels.where().idEqualTo(id).findFirst();

        return field;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<int> saveScheduling(SchedulingModel fieldModel) async {
    try {
      int percentage = await RemoteDataSourcesImpl().getProbabilityPercentage(fieldModel.scheduledDay);

      // set precipitation percentage
      SchedulingModel schedulingModel = SchedulingModel(
        id: fieldModel.id,
        scheduledDay: fieldModel.scheduledDay,
        precipitationPercentage: percentage,
        fieldName: fieldModel.fieldName,
        userName: fieldModel.userName,
      );

      if (instance != null) {
        int id = 0;

        await instance?.writeTxn(() async {
          id = await instance?.schedulingModels.put(schedulingModel) ?? 0;
        });

        return id;
      } else {
        return 0;
      }
    } catch (e) {
      print(e);
      return 0;
    }
  }


  @override
  Future<bool> deleteScheduling(int id)  async {
    try {
      if (instance != null) {
        bool success = false;

        await instance?.writeTxn(() async {
          final result = await instance?.schedulingModels.delete(id);
          success = result ?? false;
        });

        return success;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }}
