import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/hive/hive_keys.dart';
import 'package:todo_list/domain/hive/todo_data.dart';
import 'package:todo_list/ui/app.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TodoDataAdapter());

  await Hive.openBox<TodoData>(HiveKeys.appKey);
  runApp(const MyApp());
}
