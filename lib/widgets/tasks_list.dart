import 'package:flutter/material.dart';
import '../models/Task.dart';

class TodoItem extends StatelessWidget {
  final Task item;
  final Function(Task) onTap;
  final Function(Task) onDismissed;

  TodoItem({
    @required this.item,
    @required this.onTap,
    @required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 12),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
      ),
      onDismissed: (direction) => onDismissed(item),
      child: ListTile(
        title: getTextStyle(),
        leading: Icon(
            item.complete ? Icons.check_box : Icons.check_box_outline_blank),
        onTap: () => onTap(item),
      ),
    );
  }

  Widget getTextStyle() {
    if (item.complete) {
      return Text(
        item.description,
        style: TextStyle(
            decoration: TextDecoration.lineThrough, color: Colors.blueGrey),
      );
    } else {
      return Text(
        item.description,
      );
    }
  }
}
