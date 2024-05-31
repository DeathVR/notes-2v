import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list/domain/bloc/todo_bloc.dart';
import 'package:todo_list/ui/widgets/notes_input.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController infoController = TextEditingController();
    final bloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = context.read<TodoBloc>().state;
          if (state is! TodoLoaded) return;
          bloc.add(AddInfo(titleController.text, infoController.text, context));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.check),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Добавить заметку',
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'Karla',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Заголовок:',
              style: TextStyle(
                fontFamily: 'Karla',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            NotesInput(controller: titleController),
            const SizedBox(height: 16),
            const Text(
              'Описание:',
              style: TextStyle(
                fontFamily: 'Karla',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            NotesInput(
              controller: infoController,
              lines: 4,
            ),
            const SizedBox(height: 20),
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<TodoBloc>(context);
                if (state is TodoLoaded) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                      ),
                      itemCount: state.imagePath.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const AddImage();
                        } else {
                          final imagePath = state.imagePath[index - 1];
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.white,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(imagePath)),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      onPressed: () {
                                        bloc.add(DeleteImage(index - 1));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          const Color.fromRGBO(
                                              255, 255, 255, 0.7),
                                        ),
                                      ),
                                      icon: const Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return const AddImage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TodoBloc>(context);

    Future<void> _pickImage() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        bloc.add(AddImagePath(pickedFile.path));
      }
    }

    return ElevatedButton(
      onPressed: () {
        _pickImage();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        overlayColor: Colors.grey,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.grey,
        size: 40,
      ),
    );
  }
}
