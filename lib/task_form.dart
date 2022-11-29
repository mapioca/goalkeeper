import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goalkeeper/data_cache.dart';
import 'package:goalkeeper/task.dart';
import 'package:intl/intl.dart';

import 'goal.dart';

class NewTaskFormWidget extends StatefulWidget {
  const NewTaskFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewTaskFormWidget();
  }
}

class _NewTaskFormWidget extends State<NewTaskFormWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController unitTarget = TextEditingController();
  TextEditingController dateTarget = TextEditingController();

  //String? _selectedValue;
  List<String> listOfValue = [];

  void generateListOfValues() {
    for (Goal goal in DataCache.goals) {
      listOfValue.add(goal.name);
    }
  }


  @override
  void initState() {
    dateTarget.text; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    generateListOfValues();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Add New Task'),
      ),

      body: Form(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 35.0),
            ),

            ListTile(
              title: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "How would you name your task?",
                  labelText: 'Name',
                ),
              ),
            ),


/*            ListTile(
              title: TextFormField(
                controller: description,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What\'s your task about?',
                  labelText: 'Description',
                ),
              ),
            ),

            ListTile(
              title: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "What goal is this task associated to?",
                  labelText: 'Goals',
                ),
                value: _selectedValue,
                hint: const Text('choose one'),
                items: listOfValue
                    .map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),*/

            ListTile(
              title: TextFormField(
                controller: unitTarget,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'How many units needed to achieve task?',
                  labelText: 'Unit Target',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(15),
              height: 150,
              child: Center(
                child: TextField(
                  controller: dateTarget,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Date',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yMd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateTarget.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),
              ),
            ),


            Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  print('Before adding: ${DataCache.goals.length}');
                  Task task = Task(name.text, description.text, 'temp' /*DataCache.goals[_selectedValue].unit, int.parse(unitTarget.text)*/, int.parse(unitTarget.text), dateTarget.text, false);
                  Navigator.pop(context, task);
                },
                //color: Colors.orange,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
