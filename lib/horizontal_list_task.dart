import 'package:flutter/material.dart';
import 'package:goalkeeper/task.dart';

import 'data_cache.dart';

class HorizontalListTask extends StatefulWidget {
  const HorizontalListTask({super.key});

  @override
  State<StatefulWidget> createState() => HorizontalListTaskState();
}

class HorizontalListTaskState extends State<HorizontalListTask> {

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
    return Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: DataCache.tasks.length,
                itemBuilder: (context, index) {
                  var borderRadius = const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)
                  );
                  return SizedBox(
                    width: 225,
                    child: ClipPath(
                      clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )),
                      child: Card(
                        child: Container(
                          height: 150,
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
                          child: Column(
                              children: [
                                ListTile(
                                  //leading: const FlutterLogo(size: 42.0),
                                  title: Text(DataCache.tasks[index].name, style: getTextStyle(DataCache.tasks[index].checked, const TextStyle(color: Colors.white)),textAlign: TextAlign.center,),
                                  //subtitle: Text(DataCache.tasks[index].dateTarget),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: borderRadius),
                                  onTap: () {
                                    onTaskChanged(DataCache.tasks[index]);
                                    //showSuccessfulDialog();
                                  },
                                ),
                                Text("+${DataCache.tasks[index].unitTarget.toString()}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32,),textAlign: TextAlign.center,),
                                //LottieBuilder.network("https://assets10.lottiefiles.com/packages/lf20_eRt4aHeLmL.json"),
                              ]
                          ),
                        ),
                      ),
                    ),
                  );

                }
            ),
          )
        ]);
  }

}