import 'package:flutter/material.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Completed Task',
        style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
