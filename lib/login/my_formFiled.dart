import 'package:flutter/material.dart';

class MyFormfield extends StatelessWidget {
  final TextEditingController Control;
  final String validation;
  final String hint;
  final bool isPassword;
  final VoidCallback Onpress;

  const MyFormfield({
    Key? key,
    required this.Control,
    required this.validation,
    this.isPassword=false,
    required this.Onpress,
     this.hint='',


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
    /*  decoration: BoxDecoration(
       // shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(
          color: Colors.grey[400]!,


        ),
      ),*/
      child: TextFormField(


      //  decoration: InputDecoration(
        //  suffixIcon: Icon(Icons.remove_red_eye),
        //),
        onTap: (){
          Onpress();
        },
        decoration:InputDecoration(
          hintText:hint,
          hintStyle: TextStyle(color: Colors.grey[400],fontSize: 10.0,),
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
        ) ,
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
