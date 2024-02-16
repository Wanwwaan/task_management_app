import 'package:task_management_app/models/tab_task.dart';

class TabKey {
  static var todo = TabTask(key: 'TODO', value: 'To-do');
  static var doing = TabTask(key: 'DOING', value: 'Doing');
  static var done = TabTask(key: 'DONE', value: 'Done');
}
