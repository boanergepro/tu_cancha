import 'package:isar/isar.dart';
import 'package:tu_cancha/src/data/datasources/local/local_data_sources.dart';
import 'package:tu_cancha/src/data/datasources/remote/remote_data_sources.dart';
import 'package:tu_cancha/src/data/models/scheduling_model.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/domain/repositories/scheduling_repository.dart';

class SchedulingRepositoryImpl implements SchedulingRepository {
  final LocalDataSources localDataSources;
  final Isar? isar;

  SchedulingRepositoryImpl(this.localDataSources, this.isar);

  @override
  Future<Scheduling?> get(int id) async {
    var scheduling = await LocalDataSourcesImpl(instance: isar).getSchedulingById(id);

    if (scheduling == null) return null;

    return scheduling.toEntity();
  }

  @override
  Future<List<Scheduling>> getAll() async {
    var scheduling = await LocalDataSourcesImpl(instance: isar).getScheduling();

    if (scheduling.isEmpty) return [];

    return scheduling.map((e) => e.toEntity()).toList();
  }

  @override
  Future<int> create(Scheduling scheduling) async {
    var schedulingModel = SchedulingModel.fromEntity(scheduling);
    return await LocalDataSourcesImpl(instance: isar).saveScheduling(schedulingModel);
  }

  @override
  Future<bool> delete(int id) async {
    bool success = false;

    success = await LocalDataSourcesImpl(instance: isar).deleteScheduling(id);
    return success;
  }

  @override
  Future<int> getProbabilityPercentage(DateTime dateScheduling) async {
    return await RemoteDataSourcesImpl().getProbabilityPercentage(dateScheduling);
  }
}