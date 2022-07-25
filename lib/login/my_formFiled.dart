import 'package:flutter/material.dart';

class MyFormfield extends StatelessWidget {
  final TextEditingController Control;
  final String validation;
  final bool isPassword;

  const MyFormfield({
    Key? key,
    required this.Control,
    required this.validation,
    this.isPassword=false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.grey,

        ),
      ),
      child: TextFormField(
      //  decoration: InputDecoration(
        //  suffixIcon: Icon(Icons.remove_red_eye),
        //),
        controller: Control,
        obscureText: isPassword,

        validator:(value){
          if (value!.isEmpty){
            return validation;
          }
          return null;
        } ,

      ),
    );
  }
}
