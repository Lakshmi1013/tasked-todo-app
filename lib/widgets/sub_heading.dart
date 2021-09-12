import 'package:flutter/material.dart';
import '../provider/taskedapp_provider.dart';
import 'package:provider/provider.dart';

class SubHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'tasked',
          style: TextStyle(
            color: Colors.orange.shade900,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Provider.of<StateProvider>(context, listen: true).isTasksEmpty()
            ? Text("")
            : Text(
                '${Provider.of<StateProvider>(context, listen: true).getNumberOfInCompletedTasks()} Incomplete, ${Provider.of<StateProvider>(context, listen: true).getNumberOfCompletedTasks()} Completed',
                style: TextStyle(color: Colors.blueGrey, fontSize: 10),
              ),
        Divider(
          height: 20,
          thickness: 5,
        )
      ],
    );
  }
}
