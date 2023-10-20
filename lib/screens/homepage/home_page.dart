import 'package:flutter/material.dart';
import 'package:to_do_app/screens/homepage/widgets/app_bar.dart';
import 'package:to_do_app/screens/homepage/widgets/float_action_button.dart';
import '../../provider/data_provider.dart';
import '../../widgets/note_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    Provider.of<ToDoData>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffeb9e),
      appBar: const MyAppBar(),
      floatingActionButton: const MyFloatingButton(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _filter(),
          Divider(color: Colors.red[200]),
          Divider(color: Colors.red[200], height: 0.7),
          Expanded(
            child: ListView.builder(
              itemCount:
                  (context).select((ToDoData toDo) => toDo.toDoList.length),
              itemBuilder: (context, index) {
                return NoteTile(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _filter() {
    return InkWell(
      onTap: () {
        setState(() {
          Provider.of<ToDoData>(context, listen: false).activeFilter();
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Text(
              'Título',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            (context).select((ToDoData toDo) => toDo.isActive)
                ? const Icon(Icons.arrow_upward)
                : const Icon(Icons.arrow_downward),
          ],
        ),
      ),
    );
  }
}
