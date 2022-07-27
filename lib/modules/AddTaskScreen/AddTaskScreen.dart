import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../login/my_button.dart';
import '../../login/my_formFiled.dart';
class AddTaskScreen extends StatefulWidget {

   AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final List<String> RemindItems = ["1 day before", "1 hour before", "30 min before", "10 min before"];
  final List<String> RepeatItems = ["daily", "weekly",];


  String? _selectedRemindItems;
  String? _selectedRepeatItems;
  DateTime? _selectedDate;
  TextEditingController TitleController =TextEditingController();

  TextEditingController DateController =TextEditingController();

  TextEditingController StartTimeController =TextEditingController();

  TextEditingController EndTimeController =TextEditingController();

  TextEditingController RemindController =TextEditingController();

  TextEditingController RepeatController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          '  Add task',
          style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Title',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                hint: 'Design team meating',
                Control: TitleController,
                validation: 'title must not be empty', Onpress: () {  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Date',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                Control: DateController,
                hint: '2021-02-28',
                validation: 'date must not be empty', Onpress: () {

                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now())
                    .then((pickedDate) {
                  if (pickedDate == null) {
                    return;
                  }
                  setState(() {
                    _selectedDate = pickedDate;
                  //  DateController.text=_selectedDate.toString();
                    DateController.text=DateFormat.yMMMd().format(pickedDate);

                  });
                });

              },
              ),
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Text('Start Time',style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
                SizedBox(width: 100,),
                Text('End Time',style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
              ],
            ),
          /*  Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                Control: StartTimeController, validation: 'must not be empty', Onpress: () {  },

              ),
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 17),
                child: Container(
                  width: 150,
                  child: MyFormfield(
                    hint: '11:00 AM',
                    Control: StartTimeController, validation: 'must not be empty', Onpress: ()
                  async {
                    final TimeOfDay? result =await  showTimePicker(
                        context: context, 
                        initialTime: TimeOfDay.now(),

                    );
                    if (result != null) {
                      setState(() {
                        StartTimeController.text = result.format(context);
                      });
                    }
                  },

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 150,
                  child: MyFormfield(
                    hint: '1:00 PM',
                    Control: EndTimeController, validation: 'must not be empty', Onpress: ()
                  async {
                    final TimeOfDay? result =await  showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),

                    );
                    if (result != null) {
                      setState(() {
                        EndTimeController.text = result.format(context);
                      });
                    }
                  },


                  ),
                ),
              ),
            ],),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Remind',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],



                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<String>(
                    value: _selectedRemindItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedRemindItems = value;
                      });
                    },
                    hint: const Center(
                        child: Text(
                          'Select the remind',
                          style: TextStyle(color: Colors.grey,fontSize: 10,
                          ),
                        )),
                    // Hide the default underline
                    underline: Container(),
                    // set the color of the dropdown menu
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                    isExpanded: true,

                    // The list of options
                    items: RemindItems
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ))
                        .toList(),
                  )),
            ),

           /* Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                Control: RemindController,
                hint: '10 min early',
                validation: 'title must not be empty', Onpress: () {  },
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Repeat',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
           /* Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                hint: 'weekly',
                Control: RepeatController,
                validation: 'title must not be empty', Onpress: () {  },
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],



                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<String>(
                    value: _selectedRepeatItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedRepeatItems = value;
                      });
                    },
                    hint: const Center(
                        child: Text(
                          'Select the repeat',
                          style: TextStyle(color: Colors.grey,fontSize: 10,),
                        )),
                    // Hide the default underline
                    underline: Container(),
                    // set the color of the dropdown menu
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                    isExpanded: true,

                    // The list of options
                    items: RepeatItems
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ))
                        .toList(),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MYButton(OnClick:(){

              },text: 'Create a task' ,),
            ),


        ],),
      ),
    );
  }
}
