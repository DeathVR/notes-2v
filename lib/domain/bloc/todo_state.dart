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

  const TodoLoaded({
    this.imagePath = const [],
    this.title = '',
    this.info = '',
  });

  TodoLoaded copyWith({
    List<String>? imagePaths,
    String? title,
    String? info,
    List<TodoData>? sortedAppDataList,
  }) {
    return TodoLoaded(
      imagePath: imagePaths ?? this.imagePath,
      title: title ?? this.title,
      info: info ?? this.info,
    );
  }

  @override
  List<Object> get props => [imagePath, title, info];
}
