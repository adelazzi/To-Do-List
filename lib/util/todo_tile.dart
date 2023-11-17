// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.blue
              )
              ],
            color: const Color.fromARGB(255, 211, 232, 255),
            border: Border.all(width: 2,color:Colors.blue ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.lightBlue,
              ),

              // task name
              SizedBox(
                width: 200,
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: taskCompleted
                        ? Colors.grey
                        : Colors.lightBlue,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
