import 'package:flutter/material.dart';
import 'package:goalkeeper/data_cache.dart';
import 'package:goalkeeper/horizontal_list_task.dart';


class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<StatefulWidget> createState() => TasksScreenState();
}

class TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return const TaskListWidget();
  }
}

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    if (DataCache.tasks.isEmpty) {
      return emptyListTaskCard();
    } else {
      return const HorizontalListTask();
    }
  }

  Widget emptyListTaskCard() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
              crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
              children: const [
                Text("Your list is empty"),
                Text("Add a new Task!"),
                Icon(Icons.add_task),
              ],
            ),
          ),
        ),
      ],
    );
  }
  }