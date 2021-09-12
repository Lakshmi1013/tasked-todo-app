import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/taskedapp_provider.dart';
import 'tasks_list.dart';

class IncompleteTasks extends StatelessWidget {
  final BuildContext ctx;
  IncompleteTasks(this.ctx);
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
              "INCOMPLETE TASKS : ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          )),
      Container(
        height: 300,
        child:
            Consumer<StateProvider>(builder: (context, stateProvider, child) {
          return stateProvider.incompleteItems.isNotEmpty
              ? ListView.builder(
                  itemCount: stateProvider.incompleteItems.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      item: stateProvider.incompleteItems[index],
                      onTap: stateProvider.chanceCompleteness,
                      onDismissed: stateProvider.removeItem,
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
