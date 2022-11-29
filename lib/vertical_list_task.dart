import 'package:flutter/material.dart';
import 'package:goalkeeper/task.dart';
import 'package:goalkeeper/task_form.dart';

import 'data_cache.dart';

class VerticalListTask extends StatefulWidget {
  const VerticalListTask({super.key});

  @override
  State<StatefulWidget> createState() => VerticalListTaskState();
}

class VerticalListTaskState extends State<VerticalListTask> {

  void onTaskChanged(Task task) {
    setState(() {
      task.checked = !task.checked;
    });
  }

  getTextStyle(bool checked, TextStyle textStyle) {
    if (!checked) {
      return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    } else {
      return const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.lineThrough,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    if(DataCache.tasks.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
          crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
          children: [
            const Text("Oops! Your list is empty"),
            const Text("Add a new Task!"),
            const Icon(Icons.add_task, size: 48, color: Colors.redAccent,),
            const Divider(),
            ElevatedButton(
              onPressed: () async{
                Task task = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewTaskFormWidget()));
                    DataCache.tasks.add(task);
                    setState(() {});
              }, child: const Text("Start Here"),
            ),
          ],
      );
    } else {
      return Scaffold(
        body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: DataCache.tasks.length,
                    itemBuilder: (context, index) {
                      var borderRadius = const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)
                      );
                      return Card(
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.pinkAccent[100]!,
                                  Colors.purple[900]!,
                                ],
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(15.0))
                          ),
                          child: ListTile(
                            leading: const FlutterLogo(size: 42.0),
                            trailing: Column(
                              children: [
                              const Icon(Icons.add),
                                Text(DataCache.tasks[index].unitTarget.toString()),
                              ],
                            ),
                            title: Text(DataCache.tasks[index].name,
                              style: getTextStyle(DataCache.tasks[index].checked,
                                  const TextStyle(color: Colors.white)),
                              textAlign: TextAlign.left,),
                            subtitle: Text(DataCache.tasks[index].dateTarget, style: const TextStyle(color: Colors.white),),
                            shape: RoundedRectangleBorder(
                                borderRadius: borderRadius),
                            onTap: () {
                              onTaskChanged(DataCache.tasks[index]);
                            },
                          ),
                        ),
                      );
                    }
                ),
              ),

            ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'unique tag',
          shape: const RoundedRectangleBorder(),
          child: const Icon(Icons.add),
          onPressed: () async {
            Task task = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const NewTaskFormWidget()));
            DataCache.tasks.add(task);
            setState(() {});
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      );
    }
  }

}