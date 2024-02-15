import 'package:moment_dart/moment_dart.dart';

class DateHelper {
  static String dateGroupSeparator(String date) {
    return Moment(DateTime.parse(date)).format('DD MMMM YYYY');
  }
}
