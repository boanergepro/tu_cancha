import 'package:isar/isar.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';

part 'scheduling_model.g.dart';

@collection
class SchedulingModel {
  Id id = Isar.autoIncrement;

  String? fieldName;

  String? userName;

  DateTime scheduledDay = DateTime.now();

  int? precipitationPercentage;

  SchedulingModel({
    required this.id,
    this.fieldName,
    this.userName,
    required this.scheduledDay,
    this.precipitationPercentage,
  });

  factory SchedulingModel.fromEntity(Scheduling scheduling) => SchedulingModel(
        id: scheduling.id ?? Isar.autoIncrement,
        fieldName: scheduling.name,
        userName: scheduling.userName,
        scheduledDay: scheduling.scheduledDay,
        precipitationPercentage: scheduling.precipitationPercentage,
      );

  Scheduling toEntity() => Scheduling(
        id: id,
        name: fieldName ?? '',
        userName: userName ?? '',
        scheduledDay: scheduledDay,
        precipitationPercentage: precipitationPercentage ?? 0,
      );
}
