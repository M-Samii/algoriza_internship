import 'package:flutter/material.dart';

class NotificationDesign extends StatelessWidget {
  const NotificationDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(left: 2, top: 5, right: 2, bottom: 5),
        child: Material(
          elevation: 20.0,
          shadowColor: Colors.blueGrey,
          child: ListTile(
            leading: const Icon(
                Icons.notifications_active_outlined, color: Colors.red),
            title: Text('',),
            subtitle: Text(''),
            onTap: () {

            },
          ),
        ),
      )
    ]);
  }
}