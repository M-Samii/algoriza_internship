import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../login/my_button.dart';
import '../../login/my_formFiled.dart';


class register_screen extends StatefulWidget {
  TextEditingController numberController =TextEditingController();
  TextEditingController EmailController =TextEditingController();
  TextEditingController PasswordController =TextEditingController();
  final formKey =GlobalKey<FormState>();
   register_screen({Key? key}) : super(key: key);

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  TextEditingController numberController =TextEditingController();
  TextEditingController EmailController =TextEditingController();
  TextEditingController PasswordController =TextEditingController();
  final formKey =GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,

      //color set to transperent or set your own color
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
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
                    fontSize: 10,
                    color: Colors.grey,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    'Register',
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
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                Control: EmailController,
                validation: 'Email must not be empty', Onpress: () {  },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
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
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyFormfield(
                Control: PasswordController,
                validation: 'password must not be empty',
                isPassword: true, Onpress: () {  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:MYButton(
                text: 'Sign up',
                OnClick: (){
                  if(formKey.currentState!.validate()){

                  }
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        //CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}"),
      ],
    ),
  );
}
