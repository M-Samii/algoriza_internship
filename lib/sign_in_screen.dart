import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_program/my_button.dart';
import 'package:intern_program/my_formFiled.dart';
import 'package:intern_program/register_screen.dart';

class SignIN extends StatelessWidget {
  TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.all(0),
                  child: Image.asset(
                    'assets/s.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  'Welcome to Fashion Daily',
                  style: TextStyle(
                      fontSize: 10, color: Colors.grey, fontFamily: 'Arial'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Help',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.help,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  CountryPickerDropdown(
                    initialValue: 'AR',
                    itemBuilder: _buildDropdownItem,
                    //itemFilter:  ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
                    priorityList: [
                      CountryPickerUtils.getCountryByIsoCode('GB'),
                      CountryPickerUtils.getCountryByIsoCode('CN'),
                    ],
                    sortComparator: (Country a, Country b) =>
                        a.isoCode.compareTo(b.isoCode),
                    onValuePicked: (Country country) {
                      print("${country.name}");
                    },
                  ),
                  Container(
                    width: 280.0,
                    decoration: BoxDecoration(

                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: TextFormField(
                      validator:(value){
                        if (value!.isEmpty){
                          return 'number must\'t be empty';
                        }
                        return null;
                      } ,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MYButton(
                  text: 'Sign in',
                  OnClick: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ),
              Center(
                child: Text('Or',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Colors.transparent,
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/google.png'),
                          height: 30.0,
                          width: 30.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Sign with by google',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Doesn\'t has any account',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => register_screen(),
                            ));
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
           // CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}"),
          ],
        ),
      );
}
