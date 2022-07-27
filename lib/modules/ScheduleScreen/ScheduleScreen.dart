import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
               // _selectedValue = date;
              });
            },
          ),
        ),
      ],
    ),
    );
  }
}
