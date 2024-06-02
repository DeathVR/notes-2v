import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/bloc/todo_bloc.dart';
import 'package:todo_list/domain/hive/todo_data.dart';
import 'package:todo_list/ui/pages/add_page.dart';
import 'package:todo_list/ui/pages/detail_page.dart';
import 'package:todo_list/ui/pages/search_page.dart';

import 'package:todo_list/ui/widgets/notes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            onPressed: () {
              bloc.add(ButtonSort());
            },
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
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            List<TodoData> appDataList = state.todoList.toList();

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
        },
      ),
    );
  }
}
