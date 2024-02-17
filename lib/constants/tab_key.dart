import 'package:task_management_app/models/tab_task.dart';

const todo = 'TODO';
const doing = 'DOING';
const done = 'DONE';

class TabKey {
  static final todoTab = TabTask(key: todo, value: 'To-do');
  static final doingTab = TabTask(key: doing, value: 'Doing');
  static final doneTab = TabTask(key: done, value: 'Done');
}
