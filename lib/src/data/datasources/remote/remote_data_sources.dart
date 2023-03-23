import 'package:dio/dio.dart';

abstract class RemoteDataSources {
  Future<int> getProbabilityPercentage(DateTime dateScheduling);
}

class RemoteDataSourcesImpl implements RemoteDataSources {
  final dio = Dio();

  @override
  Future<int> getProbabilityPercentage(DateTime dateScheduling) async {

    String date = dateScheduling.toString().substring(0, 10);

    final response = await dio.get('https://api.open-meteo.com/v1/forecast?latitude=8.99&longitude=-79.52&timezone=auto&forecast_days=1&start_date=$date&end_date=$date&hourly=precipitation_probability');

    List<int> listOfProbability = [];
    listOfProbability = List<int>.from(response.data['hourly']['precipitation_probability']);

    return getProbability(listOfProbability);

  }
}

int getProbability(List<int> list) {
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }
  return sum ~/ list.length;
}