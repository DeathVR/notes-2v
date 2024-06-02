import 'package:hive/hive.dart';
import 'package:todo_list/domain/hive/hive_keys.dart';
import 'package:todo_list/domain/hive/todo_data.dart';

class HiveBoxes {
  static final Box<TodoData> appBox = Hive.box<TodoData>(HiveKeys.appKey);
}
