import 'package:flutter/material.dart';
import '../provider/taskedapp_provider.dart';
import 'package:provider/provider.dart';
import './incomplete_tasks.dart';
import './complete_tasks.dart';

// widget to display incomplete and complete tasks
class TasksTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Provider.of<StateProvider>(context, listen: true).isTasksEmpty()
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "No tasks",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tap the Add button to create a note',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  IncompleteTasks(context),
                  CompleteTasks(context),
                ],
              ),
      ),
    );
  }
}
