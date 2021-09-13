import 'package:flutter/material.dart';
import 'package:tasked_app/helpers/database.dart';
import '../models/Task.dart';

class StateProvider with ChangeNotifier {
  List<Task> incompleteItems = List<Task>.empty(growable: true);
  List<Task> completedItems = List<Task>.empty(growable: true);

  bool executingonce = false;

  void editTask(Task item, String description) {
    if (description != null && description != '') {
      item.description = description;
      notifyListeners();
    }
  }

  void removeItem(Task item) async {
    List<Tasktable> task = await AppDatabase().getAllTasks();
    for (Tasktable element in task) {
      if (item.description == element.taskDescription)
        AppDatabase().deleteTask(element);
    }
    incompleteItems.remove(item);
    //AppDatabase().deleteTask(item.description)
    notifyListeners();
  }

  void removeCompletedItem(Task item) async {
    List<Tasktable> task = await AppDatabase().getAllTasks();
    for (Tasktable element in task) {
      if (item.description == element.taskDescription)
        AppDatabase().deleteTask(element);
    }
    completedItems.remove(item);
    notifyListeners();
  }

  void addNewTask(String description) async {
    Task newTask = Task(description);

    if (description != null && description != '') {
      incompleteItems.add(newTask);
      AppDatabase().insertTask(
          Tasktable(taskDescription: description, taskComplete: false));

      notifyListeners();
    }
  }

  void undoTask(Task item) {
    completedItems.remove(item);
    addNewTask(item.description);
  }

  void chanceCompleteness(Task item) async {
    item.complete = !item.complete;
    incompleteItems.remove(item);
    completedItems.add(Task(
      item.description,
      complete: item.complete,
    ));
    List<Tasktable> task = await AppDatabase().getAllTasks();
    for (Tasktable element in task) {
      if (item.description == element.taskDescription)
        AppDatabase().updateTask(element.copyWith(taskComplete: true));
    }
    // remove from incomplete and add to complete with current state
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
    if (!executingonce) {
      fillDataFromDB();
      executingonce = true;
    }
    if (completedItems.isNotEmpty || incompleteItems.isNotEmpty)
      return false;
    else
      return true;
  }

  void fillDataFromDB() async {
    List<Tasktable> task = await AppDatabase().getAllTasks();
    for (Tasktable element in task) {
      print(
          'data' + element.taskDescription + (element.taskComplete).toString());
      if (!element.taskComplete)
        incompleteItems.add(Task(element.taskDescription));
      else
        completedItems
            .add(Task(element.taskDescription, complete: element.taskComplete));
      notifyListeners();
    }
  }
}
