import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'data_cache.dart';
import 'goal.dart';
import 'goal_form.dart';
import 'horizontal_list_goal.dart';

class VerticalListGoal extends StatefulWidget {
  const VerticalListGoal({super.key});

  @override
  State<StatefulWidget> createState() => VerticalListGoalState();
}

class VerticalListGoalState extends State<VerticalListGoal> {

  Future<void> navigateAndDisplayGoalForm(BuildContext context) async{
    Goal goal = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const NewGoalFormWidget()));

    DataCache.goals.add(goal);

    setState(() {

    });

    print('After adding: ${DataCache.goals.length}');
  }

  @override
  Widget build(BuildContext context) {

    if (DataCache.goals.isEmpty) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
            crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
            children:  [
              const Text("Oops! Your list is empty"),
              const Text("Add a new Goal!"),
              const Icon(Icons.auto_awesome_sharp, size: 48, color: Colors.redAccent,),
              const Divider(),
              ElevatedButton(
                  onPressed: () async {
                    Goal goal = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const NewGoalFormWidget()));
                    DataCache.goals.add(goal);
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
                    itemCount: DataCache.goals.length,
                    itemBuilder: (context, index) {
                      var borderRadius = const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)
                      );
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.blueAccent[100]!,
                                  Colors.purple[900]!,
                                ],
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              )
                          ),
                          child: ListTile(
                            leading: const FlutterLogo(size: 42.0),
                            title: Text(DataCache.goals[index].name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            subtitle: Text("${DataCache.goals[index]
                                .description} \nBy ${DataCache.goals[index]
                                .dateTarget}", style: const TextStyle(color: Colors.white),),
                            isThreeLine: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: borderRadius),
                            onTap: () {},
                            trailing: CircularPercentIndicator(
                              animation: true,
                              radius: 25.0,
                              lineWidth: 6.0,
                              percent: DataCache.goals[index].progress / 100.00,
                              center: Text("${DataCache.goals[index].progress}%",
                                style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              progressColor: determineProgressColor(
                                  DataCache.goals[index].progress),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ]),
        floatingActionButton: FloatingActionButton(
          heroTag: 'unique tag',
          shape: const RoundedRectangleBorder(),
          child: const Icon(Icons.add),
          onPressed: () async {
            Goal goal = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewGoalFormWidget()));
            DataCache.goals.add(goal);
            setState(() {});
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      );
    }
  }

}
