import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/hive/hive_box.dart';
import 'package:todo_list/domain/provider/app_provider.dart';
import 'package:todo_list/ui/pages/add_page.dart';
import 'package:todo_list/ui/pages/detail_page.dart';
import 'package:todo_list/ui/pages/search_page.dart';

import 'package:todo_list/ui/widgets/notes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.clearPhoto();
          model.clearControllers();
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
                      action: () => model.deleteBox(index, context),
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
        },
      ),
    );
  }
}
