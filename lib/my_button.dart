import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback OnClick;

  const MYButton({
    Key? key,
    required this.text,
    this.textColor=Colors.white,
    required this.OnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.blue,
      ),
      child: MaterialButton(
        onPressed: () {
          OnClick();
        },
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
