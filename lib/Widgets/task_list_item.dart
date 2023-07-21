
import 'package:flutter/material.dart';
import 'package:to_do_app/Task_model.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.white12,
              blurRadius: 10.0,
            )
          ]
        ),
      child: ListTile(
        title: Text(widget.task.name),
      ),
    );
  }
}
