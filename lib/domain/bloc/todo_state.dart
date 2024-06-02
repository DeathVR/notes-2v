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
<<<<<<< HEAD
  final List<TodoData> todoList;
  final bool isSorted;
=======
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d

  const TodoLoaded({
    this.imagePath = const [],
    this.title = '',
    this.info = '',
<<<<<<< HEAD
    this.todoList = const [],
    this.isSorted = true,
=======
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
  });

  TodoLoaded copyWith({
    List<String>? imagePaths,
    String? title,
    String? info,
<<<<<<< HEAD
    List<TodoData>? todoList,
    bool? isSorted,
=======
    List<TodoData>? sortedAppDataList,
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
  }) {
    return TodoLoaded(
      imagePath: imagePaths ?? this.imagePath,
      title: title ?? this.title,
      info: info ?? this.info,
<<<<<<< HEAD
      todoList: todoList ?? this.todoList,
      isSorted: isSorted ?? this.isSorted,
=======
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
    );
  }

  @override
<<<<<<< HEAD
  List<Object> get props => [imagePath, title, info, todoList, isSorted];
=======
  List<Object> get props => [imagePath, title, info];
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
}
