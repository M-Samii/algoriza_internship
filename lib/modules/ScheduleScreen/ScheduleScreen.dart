import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
        '  Schedule',
        style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        ),
            body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.lightGreen,
            selectedTextColor: Colors.white,
            height: 84,
            onDateChange: (date) {
              // New date selected
              setState(() {
               _selectedValue = DateFormat.yMMMd().format(date);
              // print(_selectedValue);
              });
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width:330.0,
            height: 60.0,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.orange,
            ),
            child:Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('09:00 AM ',style: TextStyle(color:Colors.white,),),
                    ),
                    Text('go to gym ',style: TextStyle(color:Colors.white,),),

                  ],
                ),
                SizedBox(width: 180.0,),
                 IconButton(onPressed: (){}, icon: Icon(Icons.check_circle_outline),),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width:330.0,
            height: 60.0,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.red,
            ),
            child:Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('10:00 AM ',style: TextStyle(color:Colors.white,),),
                      ),
                      Text('Do the project ',style: TextStyle(color:Colors.white,),),

                    ],
                  ),
                ),
                SizedBox(width: 165.0,),
                 IconButton(onPressed: (){}, icon: Icon(Icons.check_circle_outline),),
              ],
            ),
          ),
        ),


      ],
    ),
    );
  }
}
