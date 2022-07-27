import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../Component/Constants.dart';
import '../../Component/my_button.dart';
import '../../Component/my_formFiled.dart';
class AddTaskScreen extends StatefulWidget {

   AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Database? database;

  @override
  void initState(){
    createDatabase();

    //  insertToDatabase();

  }
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
          'Add task',
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
                validation: 'date must not be empty',
                readonly: true,
                Onpress: () {

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
                SizedBox(width: 15,),
                Text('Start Time',style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
                SizedBox(width: 115.0,),
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
                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 17,right: 10),
                child: Container(
                  width: 150,
                  child: MyFormfield(
                    readonly: true,
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
                    readonly: true,
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
                insertToDatabase(startTime: StartTimeController.text , date: DateController.text, title: TitleController.text, endTime: EndTimeController.text , Reminder: _selectedRemindItems.toString(), repeate: _selectedRepeatItems.toString());

              },text: 'Create a task' ,),
            ),
           /* MYButton(text: 'get', OnClick: (){
              getDataFromDatabase(database);
              print(list.length);
            })*/



        ],),
      ),
    );
  }
  void createDatabase()async
  {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async
      {
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,startTime TEXT,endTime TEXT,Reminder TEXT, repeate TEXT)').then((value) {
          print('table created');
        }).catchError((error){
          print('error when creating table ${error.toString()}');
        });

      },
      onOpen: (database)
      {
        print('database opend');
        getDataFromDatabase(database);

      },

    );
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String Reminder,
    required String repeate,
  })
  async {
    /* await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks(title, date, startTime, endTime, Reminder, repeate) VALUES("first task","0022","12","1","yes","daily")').then((value){print('$value inserted successfully');}).catchError((error){
        print('error when insertion new record  ${error.toString()}');
      });

    });*/
    return await database!.transaction((txn) async {
      int? id1 = await txn.rawInsert(
          'INSERT INTO tasks(title, date, startTime, endTime, Reminder, repeate) VALUES("$title","$date","$startTime","$endTime","$Reminder","$repeate")').then((value){print('$value inserted successfully');}).catchError((error){
        print('error when insertion new record  ${error.toString()}');
      });

    });


  }
  Future<List<Map>> getDataFromDatabase(database)async{
   // List<Map> list = await database!.rawQuery('SELECT * FROM tasks WHERE ID = 21');
     list = await database!.rawQuery('SELECT * FROM tasks');
    print(list);
    return list;

  }

}
