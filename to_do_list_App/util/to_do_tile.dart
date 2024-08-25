import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {Key? key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              onPressed: deleteFunction,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                fillColor: MaterialStateProperty.all(Colors.yellow),
              ),
              Text(taskName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
