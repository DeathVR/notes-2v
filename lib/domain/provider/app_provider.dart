import 'package:flutter/material.dart';
import 'package:todo_list/domain/hive/hive_box.dart';
import 'package:todo_list/domain/hive/todo_data.dart';

class AppProvider extends ChangeNotifier {
  final List<String> _imagePaths = [];

  List<String> get imagePaths => _imagePaths;

  void addImagePath(String path) {
    _imagePaths.add(path);
    notifyListeners();
  }

  void clearPhoto() {
    imagePaths.clear();
    notifyListeners();
  }

  void removeImagePath(int index) {
    _imagePaths.removeAt(index);
    notifyListeners();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController infoController = TextEditingController();

  void addInfo(BuildContext context) async {
    await HiveBoxes.appBox
        .add(
          TodoData(
            title: titleController.text,
            info: infoController.text,
            imagePath: List<String>.from(_imagePaths),
          ),
        )
        .then(
          (value) => notifyListeners(),
        )
        .then((value) => Navigator.of(context).pop());
  }

  void clearControllers() {
    titleController.clear();
    infoController.clear();
  }

  Future<void> deleteBox(int index, BuildContext context) async {
    await HiveBoxes.appBox.deleteAt(index);
  }
}
