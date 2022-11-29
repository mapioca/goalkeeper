import 'package:flutter/material.dart';
import 'package:goalkeeper/data_cache.dart';
import 'package:goalkeeper/horizontal_list_goal.dart';

/*class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<StatefulWidget> createState() => GoalsScreenState();
}

class GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return const GoalListWidget();
  }
}*/

class GoalListWidget extends StatefulWidget {
  const GoalListWidget({super.key});

  @override
  State<GoalListWidget> createState() => _GoalListWidgetState();
}

class _GoalListWidgetState extends State<GoalListWidget> {

  @override
  Widget build(BuildContext context) {
    if (DataCache.goals.isEmpty) {
      return emptyListGoalCard();
    } else {
      return const HorizontalListGoal();
    }
  }

/*  determineProgressColor(int progress) {
    if(progress > 75) {
      return Colors.greenAccent;
    } else if (progress < 25) {
      return Colors.redAccent;
    } else {
      return Colors.orangeAccent;
    }
  }*/

  Widget emptyListGoalCard() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
              crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
              children: const [
                Text("Your list is empty"),
                Text("Add a new Goal!"),
                Icon(Icons.auto_awesome_sharp),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /*Widget horizontalListGoalCard() {
    return Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DataCache.goals.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 225,
                    child: ClipPath(
                      clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Card(
                          elevation: 20,
                          child: ClipPath(
                            clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3))),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
                                crossAxisAlignment: CrossAxisAlignment.center,//the horizontal axis of a column, again we position the children's at the center of the horizontal axis
                                children: [
                                  const FlutterLogo(size: 45.0),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                    child: Text(DataCache.goals[index].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Divider(),
                                  CircularPercentIndicator(
                                    animation: true,
                                    radius: 35.0,
                                    lineWidth: 12.0,
                                    footer: Padding(
                                        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0, bottom: 0.0),
                                        child: Text(DataCache.goals[index].dateTarget, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                                    ),
                                    percent: DataCache.goals[index].progress / 100.00,
                                    center: Text("${DataCache.goals[index].progress}%",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    progressColor: determineProgressColor(
                                        DataCache.goals[index].progress),
                                  ),
                                  const Divider(),

                                  *//*ListTile(
                                  leading: const FlutterLogo(size: 25.0),
                                  title: Text(DataCache.goals[index].name),
                                  subtitle: Text("${DataCache.goals[index]
                                      .description} \n${DataCache.goals[index]
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
                                ),*//*
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ]);
  }*/

/*  Widget verticalListGoalCard() {
    *//*return Column(
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
        ]);*//*
  }*/
}