

import 'package:flutter/material.dart';
import 'package:intern_program/my_button.dart';
import 'package:intern_program/register_screen.dart';
import 'package:intern_program/sign_in_screen.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,

                ),
                child: Image.asset('assets/bike.png',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Get food delivery to your doorstep asap',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'We have young and professinal delivery team that will bring your food as soon as possible to your doorstep',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 0.7,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,

                ),
                child: Image.asset('assets/walk.png',
                height: 250.0,),
              ),
              SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Buy any food from your favorite restaurant',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'We are constantly adding your favorite restaurant throughout the territory and around your area carefully selected',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 0.7,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50), right: Radius.circular(50))),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder:  (context) => SignIN() ));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIndicator(
                            netDragPercent: dragDistance,
                            pagesLength: pagesLength,
                            shouldPaint: true,
                            indicator: Indicator(
                              activeIndicator: ActiveIndicator(
                                  color: Colors.grey, borderWidth: 7),
                              closedIndicator: ClosedIndicator(
                                  color: Colors.blue, borderWidth: 7),
                              indicatorDesign: IndicatorDesign.line(
                                lineDesign: LineDesign(
                                  lineType: DesignType.line_nonuniform,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: MYButton(
                        text: 'Get Strated',
                        OnClick: (){
                          Navigator.push(context,MaterialPageRoute(builder:  (context) => SignIN() ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => register_screen(),
                                  ));
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15)))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}