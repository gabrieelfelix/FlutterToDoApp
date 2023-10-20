import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/services/data_services.dart';

class ToDoData with ChangeNotifier {
  late SharedPreferences prefs;
  List<String> toDoList = [];
  bool isActive = false;

  // Activate the alphabetical order filter
  void activeFilter() {
    isActive = !isActive;
    notifyListeners();
  }

  // Loads data at startup
  void loadData() async {
    prefs = await SharedPreferences.getInstance();
    toDoList = prefs.getStringList('toDoList') ?? [];
    ToDoManager.filterOrder(toDoList);
    notifyListeners();
  }

  // Add a new task
  void addNewTile(String text) {
    if (text != '') {
      toDoList.add(text);

      ToDoManager.addOrder(toDoList);
      prefs.setStringList('toDoList', toDoList);
    }
    notifyListeners();
  }

  // Remove task
  void removeTile(int index) {
    toDoList
        .remove(isActive ? ToDoManager.toDoListSort[index] : toDoList[index]);
    ToDoManager.removeOrder(toDoList);
    prefs.setStringList('toDoList', toDoList);
    notifyListeners();
  }
}
