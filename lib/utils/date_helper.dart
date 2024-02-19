import 'package:moment_dart/moment_dart.dart';

class DateHelper {
  static String dateGroupSeparator(String date) {
    return Moment(DateTime.parse(date)).format('YYYY-MM-DD');
  }
  static String dateGroupFormat(String date) {
    return Moment(DateTime.parse(date)).format('D MMM YYYY');
  }
}
