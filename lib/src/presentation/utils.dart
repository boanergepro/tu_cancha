import 'package:intl/intl.dart';


class Utils {
  static String getFormattedDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}