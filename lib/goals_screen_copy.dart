/*
import 'package:flutter/material.dart';
import 'package:goalkeeper/data_cache.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'goal.dart';
import 'goal_form.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<StatefulWidget> createState() => GoalsScreenState();
}

class GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return GoalListWidget();
  }
}

class GoalListWidget extends StatefulWidget {
  GoalListWidget({super.key});

  @override
  State<GoalListWidget> createState() => _GoalListWidgetState();
}

class _GoalListWidgetState extends State<GoalListWidget> {

  @override
  Widget build(BuildContext context) {

    if (DataCache.goals.isEmpty) {
      return buildEmptyGoalListCard();
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
        crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
        children: const [
          Text("Your list is empty"),
          Text("Add a new Goal!"),
          Icon(Icons.auto_awesome_sharp),
        ],
      );
    } else {
      return Column(
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
                        child: ListTile(
                          leading: const FlutterLogo(size: 42.0),
                          title: Text(DataCache.goals[index].name),
                          subtitle: Text("${DataCache.goals[index]
                              .description} \nBy ${DataCache.goals[index]
                              .dateTarget}"),
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
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            progressColor: determineProgressColor(
                                DataCache.goals[index].progress),
                          ),
                        )
                    );
                  }
              ),
            )
          ]);
    }
  }

  determineProgressColor(int progress) {
    if(progress > 75) {
      return Colors.greenAccent;
    } else if (progress < 25) {
      return Colors.redAccent;
    } else {
      return Colors.orangeAccent;
    }
  }

  Widget buildEmptyGoalListCard() {

    Future<void> navigateAndDisplayGoalForm(BuildContext context) async{
      Goal goal = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const NewGoalFormWidget()));

      DataCache.goals.add(goal);

      setState(() {

      });

      print('After adding: ${DataCache.goals.length}');
    }

    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
        crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
        children: [
          const Card(
              child: Text("Your list is empty.\nAdd a new Goal!"),
          ),
          Row(
            children: [
              ElevatedButton.icon(
                  onPressed: navigateAndDisplayGoalForm(context),
                  child: child,
                icon: const Icon(Icons.add_card),
                label: const Text("Add New"),
              ),
              const Icon(Icons.auto_awesome_sharp),
            ],
          )
        ],
      ),
    );
  }
}*/
