import 'package:flutter/material.dart';

import '../../login/my_button.dart';

class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
           width: double.infinity,
           alignment: Alignment.center,
           child: Text(
              'All Task',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
         ),
        SizedBox(height: 500,),

        MYButton(OnClick:(){

        },text: 'Add a task' ,),
      ],
    );
  }
}
