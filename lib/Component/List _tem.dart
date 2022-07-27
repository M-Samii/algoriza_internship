import 'package:flutter/material.dart';

class ListItemToDO extends StatefulWidget {
 // final String text;
   Map? model;

  ListItemToDO(  {Key? key, /*required this.text */required this.model,}) : super(key: key);

  @override
  State<ListItemToDO> createState() => _ListItemToDOState();
}

class _ListItemToDOState extends State<ListItemToDO> {
   IconData ico =Icons.check_box_outline_blank;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 30,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.white60,

        ),
        child: Row(
          children: [
            IconButton(onPressed: (){
              setState(() {
                if (ico==Icons.check_box_outline_blank)
                  ico=Icons.check_box;
                else
                 ico= Icons.check_box_outline_blank;
              });
            }, icon: Icon(ico),),
            Text(
              widget.model?['title'],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
