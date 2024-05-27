import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/app_provider.dart';
import 'package:todo_list/ui/widgets/notes_input.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.addInfo(context);
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
            NotesInput(controller: model.titleController),
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
              controller: model.infoController,
              lines: 4,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: model.imagePaths.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const AddImage();
                  } else {
                    final imagePath = model.imagePaths[index - 1];
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
                                  model.removeImagePath(index - 1);
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color.fromRGBO(255, 255, 255, 0.7)),
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
            ),
          ],
        ),
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  final Function? action;
  const AddImage({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);

    Future<void> _pickImage() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        model.addImagePath(pickedFile.path);
      } else {
        print('No image selected.');
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
