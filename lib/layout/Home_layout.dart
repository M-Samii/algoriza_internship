import 'package:flutter/material.dart';
import 'package:intern_program/modules/HomeScreen/FavoriteScreen.dart';

import '../login/my_button.dart';
import '../modules/HomeScreen/AllTaskScreen.dart';
import '../modules/HomeScreen/CompletedScreen.dart';
import '../modules/HomeScreen/UncompletedScreen.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            '  Board',
            style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){}, icon:Icon(Icons.search, color: Colors.black,)),
            IconButton(onPressed: (){}, icon:Icon(Icons.notifications_active , color: Colors.black,)),
            IconButton(onPressed: (){}, icon:Icon(Icons.menu , color: Colors.black,)),
          ],
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 10.0,
            fontWeight: FontWeight.bold,
            ),
            indicatorColor: Colors.black,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0),
                insets: EdgeInsets.symmetric(horizontal:35.0)),
            labelPadding: EdgeInsets.only(right: 10,left: 10),


            tabs: <Widget>[
              Tab(
                text: 'All',

              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Uncompleted',
              ),
              Tab(
                text: 'Favorites',
              ),
            ],
          ),

        ),

        body: TabBarView(
              children: <Widget>[
                AllTaskScreen(),
                CompletedScreen(),
                UncompletedScreen(),
                FavoriteScreen(),
              ]

          ),






      ),
      length: 4,
      initialIndex: 0,
    );
  }
}
