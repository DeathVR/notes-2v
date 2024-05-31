import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/bloc/todo_bloc.dart';
import 'package:todo_list/domain/hive/hive_box.dart';
import 'package:todo_list/domain/hive/todo_data.dart';
import 'package:todo_list/ui/pages/detail_page.dart';
import 'package:todo_list/ui/widgets/notes_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _todo = HiveBoxes.appBox.values.toList();
  List<TodoData> filter = <TodoData>[];
  final searchController = TextEditingController();

  void _search() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filter = _todo.where((todo) {
        return todo.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filter = _todo;
    }
    setState(() {});
  }

  @override
  void initState() {
    filter = _todo;
    searchController.addListener(_search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: searchController,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Karla',
            color: Colors.grey.shade800,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Поиск...',
            hintStyle: TextStyle(
              fontSize: 22,
              fontFamily: 'Karla',
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.appBox.listenable(),
        builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => DetailInforamtion(
                      title: filter[index].title,
                      data: filter[index].data,
                      info: filter[index].info,
                      image: filter[index].imagePath,
                    ),
                  );
                },
                child: NotesCard(
                  isDelete: true,
                  action: () => bloc.add(DeleteBox(index, context)),
                  title: filter[index].title,
                  info: filter[index].info,
                  data: filter[index].data,
                )),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: filter.length,
          );
        },
      ),
    );
  }
}
