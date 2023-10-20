class ToDoManager {
  static List<String> toDoListSort = [];
  // Sort list
  static void filterOrder(toDoList) {
    toDoListSort = List.from(toDoList);
    toDoListSort.sort();
  }

  // Add to ordering
  static void addOrder(toDoList) {
    toDoListSort = List.from(toDoList);
    toDoListSort.sort();
  }

  // Remove from sorting
  static void removeOrder(toDoList) {
    toDoListSort = List.from(toDoList);
    toDoListSort.sort();
  }
}
