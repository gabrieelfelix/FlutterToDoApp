import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/data_provider.dart';

class MyFloatingButton extends StatefulWidget {
  const MyFloatingButton({Key? key}) : super(key: key);

  @override
  State<MyFloatingButton> createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext bc) {
            return AlertDialog(
              title: TextField(controller: textController),
              actions: [
                TextButton(
                  onPressed: () {
                    Provider.of<ToDoData>(context, listen: false)
                        .addNewTile(textController.text.trim());
                    textController.clear();

                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
                const SizedBox(width: 7),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
      backgroundColor: const Color(0xff353535),
      child: const Icon(Icons.add),
    );
  }
}
