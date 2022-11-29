import 'package:flutter/material.dart';
import 'package:goalkeeper/data_cache.dart';
import 'package:goalkeeper/goal_form.dart';
import 'package:goalkeeper/goals_screen.dart';
import 'package:goalkeeper/task_form.dart';
import 'package:goalkeeper/tasks_screen.dart';
import 'package:goalkeeper/vertical_list_goal.dart';
import 'package:goalkeeper/vertical_list_task.dart';

import 'goal.dart';
import 'task.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const String _title = 'Goal Keeper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Main(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }

}

class Main extends StatefulWidget{
  const Main({super.key});

  @override
  State<StatefulWidget> createState() => MainState();
}


class MainState extends State<Main> {
  int _selectedIndex = 0;

  static  final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const VerticalListGoal(),
    const VerticalListTask(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> navigateAndDisplayGoalForm(BuildContext context) async{
    Goal goal = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const NewGoalFormWidget()));

    DataCache.goals.add(goal);

    setState(() {

    });

    print('After adding: ${DataCache.goals.length}');
  }

  Future<void> navigateAndDisplayTaskForm(BuildContext context) async{
    Task task = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const NewTaskFormWidget()));

    DataCache.tasks.add(task);

    setState(() {});

    print('After adding: ${DataCache.tasks.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Keeper'),
      ),
      body:  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {  },
        label: const Text("Add"),
        icon: const Icon(Icons.add),
      ),*/

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //iconSelected: const Icon(Icons.home, color: Colors.deepPurple),
            label: 'home',
            // backgroundColor: Colors.deepPurple,
            //onTap: ()  =>log('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_sharp),
            //iconSelected: const Icon(Icons.auto_awesome_sharp, color: Colors.deepPurple),
            label: 'goals',
            // backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            //iconSelected: const Icon(Icons.add_task, color: Colors.deepPurple),
            label: 'tasks',
            // backgroundColor: Colors.deepPurple,
          )
        ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepPurple,
      onTap: _onItemTapped,
      ),


      /*bottomNavigationBar: AnimatedBottomNavigationBar(
        bottomBarItems: [
          BottomBarItemsModel(
            icon: const Icon(Icons.home),
            iconSelected: const Icon(Icons.home, color: Colors.deepPurple),
            title: 'home',
            dotColor: Colors.deepPurple,
            onTap: ()  =>log('Home'),
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.auto_awesome_sharp),
            iconSelected: const Icon(Icons.auto_awesome_sharp, color: Colors.deepPurple),
            title: 'goals',
            dotColor: Colors.deepPurple,
            onTap: () =>log('Goals'),
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.add_task),
            iconSelected: const Icon(Icons.add_task, color: Colors.deepPurple),
            title: 'tasks',
            dotColor: Colors.deepPurple,
            onTap: () =>log('Tasks'),
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.settings),
            iconSelected: const Icon(Icons.settings, color: Colors.deepPurple),
            title: 'settings',
            dotColor: Colors.deepPurple,
            onTap: () =>log('Settings'),
          ),
        ],*/

        /*bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.deepPurple,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.auto_awesome_sharp,
                color: AppColors.white,
              ),
              onTap: () {
                navigateAndDisplayGoalForm(context);
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.add_task,
                color: AppColors.white,
              ),
              onTap: () async {
                navigateAndDisplayTaskForm(context);
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.cancel,
                color: AppColors.white,
              ),
              onTap: () {},
            ),
          ],
        ),*/
      );
  }
}





class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }
}

class HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          const SizedBox(
            width: 300,
            height: 45,
            child: Padding(
              padding: EdgeInsets.only(left:0, bottom: 0, right: 0, top:20),
              child: Text("Goals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 275,
            child: GoalListWidget(key: UniqueKey(),),
          ),
          const SizedBox(
            width: double.infinity,
            height: 45,
            child: Padding(
              padding: EdgeInsets.only(left:45, bottom: 0, right: 0, top:10),
              child: Text("Tasks",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: TaskListWidget(key: UniqueKey(),),
          )
          //TaskListWidget(key: UniqueKey(),),
        ],
      );

    /*return MaterialApp(
      initialRoute: '/',
      title: _title,
      routes: {
        '/goals' : (context) => const NewGoalFormWidget(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  Scaffold(
        appBar: AppBar(
          title: const Text('Goal Keeper'),
*//*                    bottom: const TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: 'Goals',
                        ),
                        Tab(
                          text: 'Tasks',
                        ),
                      ],
                    ),*//*
        ),
        body:  SizedBox(
          child: Column(
            children: <Widget>[
              const SizedBox(
                width: 300,
                height: 45,
                child: Padding(
                  padding: EdgeInsets.only(left:0, bottom: 0, right: 0, top:20),
                  child: Text("Goals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 275,
                child: GoalListWidget(key: UniqueKey(),),
              ),
              const SizedBox(
                width: double.infinity,
                height: 45,
                child: Padding(
                  padding: EdgeInsets.only(left:45, bottom: 0, right: 0, top:10),
                  child: Text("Tasks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: TaskListWidget(key: UniqueKey(),),
              )
              //TaskListWidget(key: UniqueKey(),),
            ],
          ),
        ),

        bottomNavigationBar: AnimatedBottomNavigationBar(
          bottomBarItems: [
            BottomBarItemsModel(
              icon: const Icon(Icons.home),
              iconSelected: const Icon(Icons.home, color: Colors.deepPurple),
              title: 'home',
              dotColor: Colors.deepPurple,
              onTap: ()  =>log('Home'),
            ),
            BottomBarItemsModel(
              icon: const Icon(Icons.auto_awesome_sharp),
              iconSelected: const Icon(Icons.auto_awesome_sharp, color: Colors.deepPurple),
              title: 'goals',
              dotColor: Colors.deepPurple,
              onTap: () =>log('Goals'),
            ),
            BottomBarItemsModel(
              icon: const Icon(Icons.add_task),
              iconSelected: const Icon(Icons.add_task, color: Colors.deepPurple),
              title: 'tasks',
              dotColor: Colors.deepPurple,
              onTap: () =>log('Tasks'),
            ),
            BottomBarItemsModel(
              icon: const Icon(Icons.settings),
              iconSelected: const Icon(Icons.settings, color: Colors.deepPurple),
              title: 'settings',
              dotColor: Colors.deepPurple,
              onTap: () =>log('Settings'),
            ),
          ],
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: Colors.deepPurple,
            centerIcon: const FloatingCenterButton(
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
            centerIconChild: [
              FloatingCenterButtonChild(
                child: const Icon(
                  Icons.auto_awesome_sharp,
                  color: AppColors.white,
                ),
                onTap: () {
                  navigateAndDisplayGoalForm(context);
                },
              ),
              FloatingCenterButtonChild(
                child: const Icon(
                  Icons.add_task,
                  color: AppColors.white,
                ),
                onTap: () async {
                  navigateAndDisplayTaskForm(context);
                },
              ),
              FloatingCenterButtonChild(
                child: const Icon(
                  Icons.cancel,
                  color: AppColors.white,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
        );*/
  }
}
