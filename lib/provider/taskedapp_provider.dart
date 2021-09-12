import 'package:flutter/material.dart';
import '../models/Task.dart';

//import 'package:intl/intl.dart';

class StateProvider with ChangeNotifier {
  List<Task> incompleteItems = List<Task>.empty(growable: true);
  List<Task> completedItems = List<Task>.empty(growable: true);

  void editTask(Task item, String description) {
    if (description != null && description != '') {
      item.description = description;
      notifyListeners();
    }
  }

  void removeItem(Task item) {
    incompleteItems.remove(item);
    notifyListeners();
  }

  void removeCompletedItem(Task item) {
    completedItems.remove(item);
    notifyListeners();
  }

  void addNewTask(String description) {
    if (description != null && description != '') {
      incompleteItems.add(Task(description));
      notifyListeners();
    }
  }

  void undoTask(Task item) {
    completedItems.remove(item);
    addNewTask(item.description);
  }

  void chanceCompleteness(Task item) {
    item.complete = !item.complete;
    removeItem(item);
    completedItems.add(Task(
      item.description,
      complete: item.complete,
    ));
    // remove from incomeplte and add to complete with current state
    notifyListeners();
  }

  int getNumberOfCompletedTasks() {
    notifyListeners();
    return completedItems.length;
  }

  int getNumberOfInCompletedTasks() {
    notifyListeners();
    return incompleteItems.length;
  }

  bool isTasksEmpty() {
    if (completedItems.isNotEmpty || incompleteItems.isNotEmpty)
      return false;
    else
      return true;
  }
}
