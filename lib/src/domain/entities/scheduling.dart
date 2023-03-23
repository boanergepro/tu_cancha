class Scheduling {
  const Scheduling({
    this.id,
    required this.name,
    required this.userName,
    required this.scheduledDay,
    this.precipitationPercentage = 0,
});

  final int? id;

  final String name;

  final String userName;

  final DateTime scheduledDay;

  final int precipitationPercentage;

}