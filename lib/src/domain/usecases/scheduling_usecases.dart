import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/domain/repositories/scheduling_repository.dart';

class SchedulingUseCases {
  final SchedulingRepository schedulingRepository;

  SchedulingUseCases(this.schedulingRepository);

  Future<int> createScheduling(Scheduling scheduling) async {
    return await schedulingRepository.create(scheduling);
  }

  Future<List<Scheduling>> getAllScheduling() async {
    return await schedulingRepository.getAll();
  }

  Future<Scheduling?> getScheduling(int id) async {
    return await schedulingRepository.get(id);
  }

  Future<bool> deleteScheduling(int id) async {
    return await schedulingRepository.delete(id);
  }

  Future<int> getProbability(DateTime date) async {
    return await schedulingRepository.getProbabilityPercentage(date);
  }

}