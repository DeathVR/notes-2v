part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final List<String> imagePath;
  final String title;
  final String info;
  final List<TodoData> todoList;
  final bool isSorted;

  const TodoLoaded({
    this.imagePath = const [],
    this.title = '',
    this.info = '',
    this.todoList = const [],
    this.isSorted = true,
  });

  TodoLoaded copyWith({
    List<String>? imagePaths,
    String? title,
    String? info,
    List<TodoData>? todoList,
    bool? isSorted,
  }) {
    return TodoLoaded(
      imagePath: imagePaths ?? this.imagePath,
      title: title ?? this.title,
      info: info ?? this.info,
      todoList: todoList ?? this.todoList,
      isSorted: isSorted ?? this.isSorted,
    );
  }

  @override
  List<Object> get props => [imagePath, title, info, todoList, isSorted];
}
