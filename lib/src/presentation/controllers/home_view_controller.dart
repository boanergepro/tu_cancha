import 'package:flutter/material.dart';
import 'package:tu_cancha/src/data/datasources/local/local_data_sources.dart';
import 'package:tu_cancha/src/data/db/db_connection.dart';
import 'package:tu_cancha/src/data/repositories/scheduling_repository_impl.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/domain/repositories/scheduling_repository.dart';
import 'package:tu_cancha/src/domain/usecases/scheduling_usecases.dart';

class HomeViewController with ChangeNotifier {

  late LocalDataSources _localDataSources;

  late SchedulingRepository _schedulingRepositoryIsar;

  late SchedulingUseCases _schedulingUseCases;

  HomeViewController() {

    _localDataSources = LocalDataSourcesImpl(instance: dbInstance);

    _schedulingRepositoryIsar = SchedulingRepositoryImpl(_localDataSources, dbInstance);

    _schedulingUseCases = SchedulingUseCases(_schedulingRepositoryIsar);
  }

  bool _isLoading = false;

  List<Scheduling> _listScheduling = [];

  List<Scheduling> get listScheduling => _listScheduling;

  bool get isLoading => _isLoading;

  Future<void> getListScheduling() async {
    _isLoading = true;
    notifyListeners();

    _listScheduling = await _schedulingUseCases.getAllScheduling();

    _isLoading = false;
    notifyListeners();
  }

  void setScheduling(Scheduling scheduling) {
    _listScheduling.add(scheduling);
    // order by date
    listScheduling.sort((a, b) => a.scheduledDay.compareTo(b.scheduledDay));
    notifyListeners();
  }

  Future<void> deleteScheduling(int id) async {
    _isLoading = true;
    notifyListeners();

    bool success = await _schedulingUseCases.deleteScheduling(id);

    if (success) {
      _listScheduling.removeWhere((element) => element.id == id);
    }

    _isLoading = false;
    notifyListeners();
  }
}