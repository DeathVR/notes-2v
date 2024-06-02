import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'todo_data.g.dart';

@HiveType(typeId: 0)
class TodoData {
  @HiveField(0)
  String title;

  @HiveField(1)
  String info;

  @HiveField(2)
  late String data;

  @HiveField(3)
  List<String> imagePath;

  TodoData({
    required this.title,
    required this.info,
    required this.imagePath,
  }) {
    DateTime nowTime = DateTime.now();
    data = DateFormat('dd.MM.yyyy · HH:mm').format(nowTime);
  }
}
