import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/taskedapp_provider.dart';
import 'tasks_list.dart';

class CompleteTasks extends StatelessWidget {
  final BuildContext ctx;
  CompleteTasks(this.ctx);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Text(
              "COMPLETED TASKS : ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          )),
      Container(
        height: 300,
        child:
            Consumer<StateProvider>(builder: (context, stateProvider, child) {
          return stateProvider.completedItems.isNotEmpty
              ? ListView.builder(
                  itemCount: stateProvider.completedItems.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      item: stateProvider.completedItems[index],
                      onTap: stateProvider.undoTask,
                      onDismissed: stateProvider.removeCompletedItem,
                    );
                  },
                )
              : Center(
                  child: Text('No items'),
                );
        }),
      ),
    ]);
  }
}
