import 'package:flutter/material.dart';

import '../../login/my_button.dart';
import '../../login/my_formFiled.dart';
class AddTaskScreen extends StatelessWidget {
  TextEditingController TitleController =TextEditingController();
  TextEditingController DateController =TextEditingController();
  TextEditingController StartTimeController =TextEditingController();
  TextEditingController EndTimeController =TextEditingController();
  TextEditingController RemindController =TextEditingController();
  TextEditingController RepeatController =TextEditingController();
   AddTaskScreen({Key? key}) : super(key: key);

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
                validation: 'date must not be empty', Onpress: () {  },
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
                    Control: StartTimeController, validation: 'must not be empty', Onpress: () {  },

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 150,
                  child: MyFormfield(
                    hint: '1:00 PM',
                    Control: EndTimeController, validation: 'must not be empty', Onpress: () {  },

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
              child: MyFormfield(
                Control: RemindController,
                hint: '10 min early',
                validation: 'title must not be empty', Onpress: () {  },
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                hint: 'weekly',
                Control: RepeatController,
                validation: 'title must not be empty', Onpress: () {  },
              ),
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
