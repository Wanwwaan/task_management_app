import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app/models/task.dart';
import 'package:task_management_app/models/task_list.dart';
import 'package:task_management_app/utils/date_helper.dart';

void main() {
  Map<String, dynamic> apiTasksDataAsJson = {
    "tasks": [
      {
        "id": "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
        "title": "Read a book",
        "description": "Spend an hour reading a book for pleasure",
        "createdAt": "2023-03-24T19:30:00Z",
        "status": "TODO"
      },
      {
        "id": "119a8c45-3f3d-41da-88bb-423c5367b81a",
        "title": "Exercise",
        "description": "Go for a run or do a workout at home",
        "createdAt": "2023-03-25T09:00:00Z",
        "status": "TODO"
      }
    ],
    "pageNumber": 0,
    "totalPages": 3
  };

  TaskList expectedTasksData = TaskList(
    tasks: [
      Task(
          id: "cbb0732a-c9ab-4855-b66f-786cd41a3cd1",
          title: "Read a book",
          description: "Spend an hour reading a book for pleasure",
          createdAt: "2023-03-24T19:30:00Z",
          status: "TODO"),
      Task(
          id: "119a8c45-3f3d-41da-88bb-423c5367b81a",
          title: "Exercise",
          description: "Go for a run or do a workout at home",
          createdAt: "2023-03-25T09:00:00Z",
          status: "TODO"),
    ],
    pageNumber: 0,
    totalPages: 3,
  );

  group('Test TaskList initialization from Json', () {
    test(
      'Test get tasks from json"',
      () => {
        expect(TaskList.fromJson(apiTasksDataAsJson).tasks.map((e) => e.id), expectedTasksData.tasks.map((e) => e.id)),
      },
    );
    test(
      'Test get pageNumber from json"',
      () => {
        expect(TaskList.fromJson(apiTasksDataAsJson).pageNumber, expectedTasksData.pageNumber),
      },
    );
    test(
      'Test get totalPages from json"',
      () => {
        expect(TaskList.fromJson(apiTasksDataAsJson).totalPages, expectedTasksData.totalPages),
      },
    );
  });

  group('Test date group on tasklist', () {
    String createdDate = '2023-03-24T19:30:00Z';
    String dateGroupSeparatorFormat = DateHelper.dateGroupSeparator(createdDate);
    String taskDateGroupFormat = DateHelper.dateGroupFormat(dateGroupSeparatorFormat);
    // var resultDate;
    test('Test convert createdDate to date format YYYY-MM-DD to group date order',
        () => {expect(dateGroupSeparatorFormat, '2023-03-24')});
    test('Test date diplay on tasklist format D MMM YYYY',
        () => {expect(taskDateGroupFormat, '24 Mar 2023')});
  });
}
