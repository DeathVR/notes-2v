import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:todo_list/domain/bloc/todo_bloc.dart';
import 'package:todo_list/domain/hive/todo_data.dart';
=======
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/bloc/todo_bloc.dart';
import 'package:todo_list/domain/hive/hive_box.dart';
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
import 'package:todo_list/ui/pages/add_page.dart';
import 'package:todo_list/ui/pages/detail_page.dart';
import 'package:todo_list/ui/pages/search_page.dart';

import 'package:todo_list/ui/widgets/notes_card.dart';

class HomePage extends StatelessWidget {
<<<<<<< HEAD
  const HomePage({Key? key});
=======
  const HomePage({super.key});
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(ClearImageControl());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPage(),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Заметки',
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'Karla',
          ),
        ),
        actions: [
          IconButton(
<<<<<<< HEAD
            onPressed: () {
              bloc.add(ButtonSort());
            },
=======
            onPressed: () {},
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
<<<<<<< HEAD
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            List<TodoData> appDataList =
                state.todoList.toList(); // Создание копии списка

            if (state.isSorted) {
              appDataList.sort((a, b) =>
                  appDataList.indexOf(b).compareTo(appDataList.indexOf(a)));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final todo = appDataList[index];
                final sortedList = appDataList.reversed.toList();
                final rev = sortedList[index];
                final realIndex = appDataList.indexOf(rev);
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => DetailInforamtion(
                        title: todo.title,
                        data: todo.data,
                        info: todo.info,
                        image: todo.imagePath,
                      ),
                    );
                  },
                  child: NotesCard(
                    action: () {
                      bloc.add(DeleteBox(
                          state.isSorted ? realIndex : index, context));
                    },
                    title: todo.title,
                    info: todo.info,
                    data: todo.data,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: appDataList.length,
            );
          } else {
            return Center(
              child: Text(
                'Добавьте заметки',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Karla',
                  color: Colors.grey.shade800,
                ),
              ),
            );
          }
=======
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.appBox.listenable(),
        builder: (context, value, child) {
          final appDataList = value.values.toList();

          return appDataList.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => DetailInforamtion(
                          title: appDataList[index].title,
                          data: appDataList[index].data,
                          info: appDataList[index].info,
                          image: appDataList[index].imagePath,
                        ),
                      );
                    },
                    child: NotesCard(
                      action: () {
                        bloc.add(DeleteBox(index, context));
                      },
                      title: appDataList[index].title,
                      info: appDataList[index].info,
                      data: appDataList[index].data,
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: appDataList.length,
                )
              : Center(
                  child: Text(
                    'Добавьте заметки',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Karla',
                      color: Colors.grey.shade800,
                    ),
                  ),
                );
>>>>>>> d024d81a32efcd8e5f83fa91301e848dafa9620d
        },
      ),
    );
  }
}
