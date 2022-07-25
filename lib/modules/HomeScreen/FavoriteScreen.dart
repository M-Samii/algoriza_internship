import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorite Task',
        style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
