import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/hive/hive_box.dart';
import 'package:todo_list/domain/hive/todo_data.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
<<<<<<< HEAD
  TodoBloc() : super(const TodoLoaded(todoList: [])) {
    HiveBoxes.appBox.watch().listen((event) {
      add(TodoLoadedList());
    });
=======
  TodoBloc() : super(const TodoLoaded()) {
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
    on<AddImagePath>(_onAddImagePath);
    on<DeleteImage>(_onDeleteImage);
    on<ClearImageControl>(_onClearImageControl);
    on<AddInfo>(_onAddInfo);
    on<DeleteBox>(_onDeleteBox);
<<<<<<< HEAD
    on<TodoLoadedList>(_onTodoList);
    on<ButtonSort>(_onButtonSort);
  }

  void _onAddImagePath(AddImagePath event, Emitter<TodoState> emit) {
=======
  }

  void _onAddImagePath(AddImagePath event, Emitter<TodoState> emit) {
    if (state is! TodoLoaded) return;
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
    final currentState = state as TodoLoaded;
    final updatedImagePaths = List<String>.from(currentState.imagePath)
      ..add(event.path);
    emit(currentState.copyWith(imagePaths: updatedImagePaths));
  }

  void _onDeleteImage(DeleteImage event, Emitter<TodoState> emit) {
<<<<<<< HEAD
=======
    if (state is! TodoLoaded) return;
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
    final currentState = state as TodoLoaded;
    final updatedImagePaths = List<String>.from(currentState.imagePath)
      ..removeAt(event.index);
    emit(currentState.copyWith(imagePaths: updatedImagePaths));
  }

  void _onClearImageControl(ClearImageControl event, Emitter<TodoState> emit) {
<<<<<<< HEAD
=======
    if (state is! TodoLoaded) return;
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
    final currentState = state as TodoLoaded;
    emit(currentState.copyWith(imagePaths: []));
  }

  Future<void> _onAddInfo(event, Emitter<TodoState> emit) async {
<<<<<<< HEAD
=======
    if (state is! TodoLoaded) return;
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
    final currentState = state as TodoLoaded;
    await HiveBoxes.appBox.add(
      TodoData(
        title: event.title,
        info: event.info,
        imagePath: currentState.imagePath,
      ),
    );
    Navigator.of(event.context).pop();
  }

  Future<void> _onDeleteBox(DeleteBox event, Emitter<TodoState> emit) async {
    await HiveBoxes.appBox.deleteAt(event.index);
  }
<<<<<<< HEAD

  void _onTodoList(TodoLoadedList event, Emitter<TodoState> emit) {
    final currentState = state as TodoLoaded;
    final todoList = HiveBoxes.appBox.values.cast<TodoData>().toList();

    emit(currentState.copyWith(todoList: todoList));
  }

  void _onButtonSort(ButtonSort event, Emitter<TodoState> emit) {
    final currentState = state as TodoLoaded;
    emit(currentState.copyWith(isSorted: !currentState.isSorted));
  }
=======
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
}
