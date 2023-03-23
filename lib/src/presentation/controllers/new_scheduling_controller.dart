import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tu_cancha/src/data/datasources/local/local_data_sources.dart';
import 'package:tu_cancha/src/data/db/db_connection.dart';
import 'package:tu_cancha/src/data/repositories/scheduling_repository_impl.dart';
import 'package:tu_cancha/src/domain/entities/scheduling.dart';
import 'package:tu_cancha/src/domain/repositories/scheduling_repository.dart';
import 'package:tu_cancha/src/domain/usecases/scheduling_usecases.dart';
import 'package:tu_cancha/src/presentation/constants.dart';

class NewSchedulingController with ChangeNotifier {
  late LocalDataSources _localDataSources;

  late SchedulingRepository _schedulingRepositoryIsar;

  late SchedulingUseCases _schedulingUseCases;

  NewSchedulingController() {
    _localDataSources = LocalDataSourcesImpl(instance: dbInstance);

    _schedulingRepositoryIsar =
        SchedulingRepositoryImpl(_localDataSources, dbInstance);

    _schedulingUseCases = SchedulingUseCases(_schedulingRepositoryIsar);
  }

  bool isLoading = false;
  bool isShowProbability = false;
  final TextEditingController userNameController = TextEditingController();
  String field = '';
  DateTime selectedDate = DateTime.now();
  int probabilityPrecipitation = 0;

  Future<void> getProbabilityPrecipitation() async {
    isLoading = true;
    notifyListeners();

    probabilityPrecipitation = await _schedulingUseCases.getProbability(selectedDate);

    isShowProbability = true;
    isLoading = false;
    notifyListeners();
  }

  List<Scheduling> schedulingList = [];

  Future<Scheduling?> saveScheduling() async {
    isLoading = true;
    notifyListeners();

    // get all scheduling
    schedulingList = await _schedulingUseCases.getAllScheduling();
    field = field == '' ? fieldsList.first : field;
    // instance for create
    Scheduling scheduling = Scheduling(
      userName: userNameController.text,
      name: field,
      scheduledDay: selectedDate,
    );

    // instance for return
    Scheduling? schedulingByReturn;
    bool validator = validateExistThreeScheduling();

    if (validator) {
      isLoading = false;
      cleanControllers();
      notifyListeners();
      return null;
    }

    int id = await _schedulingUseCases.createScheduling(scheduling);
    if (id > 0) {
      // read element by id
      schedulingByReturn = await _schedulingUseCases.getScheduling(id);
    } else {
      EasyLoading.showError(
        'Upps! Ocurrio un error al guardar el agendamiento',
        duration: const Duration(seconds: 4),
      );
    }

    isLoading = false;
    cleanControllers();
    notifyListeners();

    return schedulingByReturn;
  }

  bool validateExistThreeScheduling() {
    int count = 0;
    for (var item in schedulingList) {
      if (item.scheduledDay == selectedDate && item.name == field) {
        count++;
      }
    }
    return count >= 3;
  }

  void cleanControllers() {
    userNameController.clear();
    field = '';
    selectedDate = DateTime.now();
    probabilityPrecipitation = 0;
  }
}
