import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/services/data_services.dart';

import '../provider/data_provider.dart';

class NoteTile extends StatefulWidget {
  int index = 0;
  NoteTile({Key? key, required this.index}) : super(key: key);

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoData>(
      builder: (context, toDo, child) => Container(
        decoration: BoxDecoration(
          border: (widget.index == 0)
              ? const Border(
                  bottom: BorderSide(width: 0.3, color: Colors.grey),
                )
              : const Border.symmetric(
                  horizontal: BorderSide(width: 0.3, color: Colors.grey),
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toDo.isActive
                    ? ToDoManager.toDoListSort[widget.index]
                    : toDo.toDoList[widget.index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  Provider.of<ToDoData>(context, listen: false)
                      .removeTile(widget.index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Checkbox(
//         checkColor: Colors.white, value: false, onChanged: (bool? value) {});
