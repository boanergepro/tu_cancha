import 'package:tu_cancha/src/domain/entities/scheduling.dart';

abstract class SchedulingRepository {

  Future<Scheduling?> get(int id);

  Future<List<Scheduling>> getAll();

  Future<int> create(Scheduling scheduling);

  Future<bool> delete(int id);

  Future<int> getProbabilityPercentage(DateTime dateScheduling);

}