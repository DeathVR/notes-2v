part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddImagePath extends TodoEvent {
  final String path;

  const AddImagePath(this.path);

  @override
  List<Object> get props => [path];
}

class DeleteImage extends TodoEvent {
  final int index;

  const DeleteImage(this.index);

  @override
  List<Object> get props => [index];
}

class ClearImageControl extends TodoEvent {}

class AddInfo extends TodoEvent {
  final String title;
  final String info;
  final BuildContext context;

  const AddInfo(this.title, this.info, this.context);

  @override
  List<Object> get props => [title, info, context];
}

class DeleteBox extends TodoEvent {
  final int index;
  final BuildContext context;
  const DeleteBox(this.index, this.context);

  @override
  List<Object> get props => [index, context];
}
<<<<<<< HEAD

class TodoLoadedList extends TodoEvent {}

class ButtonSort extends TodoEvent {}
=======
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
