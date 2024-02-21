import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app/utils/date_helper.dart';

void main() {
  group('Test date group on tasklist', () {
    String createdDate = '2023-03-24T19:30:00Z';
    String dateGroupSeparatorFormat = DateHelper.dateGroupSeparator(createdDate);
    String taskDateGroupFormat = DateHelper.dateGroupFormat(dateGroupSeparatorFormat);
    // var resultDate;
    test(
        'Test convert createdDate to date format YYYY-MM-DD to group date order',
        () => {
              expect(dateGroupSeparatorFormat, '2023-03-24'),
            });
    test(
        'Test date diplay on tasklist format D MMM YYYY',
        () => {
              expect(taskDateGroupFormat, '24 Mar 2023'),
            });
  });
}
