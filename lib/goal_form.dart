import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goalkeeper/data_cache.dart';
import 'package:intl/intl.dart';

import 'goal.dart';

class NewGoalFormWidget extends StatefulWidget {
  const NewGoalFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewGoalFormWidget();
  }

}

class _NewGoalFormWidget extends State<NewGoalFormWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController unitTarget = TextEditingController();
  TextEditingController dateTarget = TextEditingController();

  String? _selectedValue;
  List<String> listOfValue = [
    'count',
    'steps',
    'lbs',
    'kg',
    'pages',
    'mile',
    'km'
  ];

  @override
  void initState() {
    dateTarget.text; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Add New Goal'),
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
                  hintText: "What are you trying to accomplish?",
                  labelText: 'Name',
                ),
              ),
            ),

            ListTile(
              title: TextFormField(
                controller: description,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'How will you accomplish your goal?',
                  labelText: 'Description',
                ),
              ),
            ),

            ListTile(
              title: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "How will you measure your goal?",
                  labelText: 'Unit',
                ),
                value: _selectedValue,
                hint: const Text('How will you measure your goal?'),
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
            ),

            ListTile(
              title: TextFormField(
                controller: unitTarget,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'How many units needed to achieve goal?',
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
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
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
                  Goal goal = Goal(name.text, description.text, _selectedValue!, int.parse(unitTarget.text), dateTarget.text, 0);
                  Navigator.pop(context, goal);
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
