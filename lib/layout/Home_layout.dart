import 'package:flutter/material.dart';
import 'package:intern_program/modules/HomeScreen/FavoriteScreen.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/HomeScreen/AllTaskScreen.dart';
import '../modules/HomeScreen/CompletedScreen.dart';
import '../modules/HomeScreen/UncompletedScreen.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
   Database? database;

  @override
  void initState(){
    createDatabase();
  //  insertToDatabase();

  }

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
        floatingActionButton: FloatingActionButton(onPressed: () async {
          insertToDatabase();
         List<Map> list = await database!.rawQuery('SELECT * FROM tasks WHERE ID = 15');
          print(list);
        },),






      ),
      length: 4,
      initialIndex: 0,
    );
  }

  void createDatabase()async
  {
   database = await openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database, version) async
        {
          print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,startTime TEXT,endTime TEXT,Reminder TEXT, repeate TEXT)').then((value) {
          print('table created');
        }).catchError((error){
          print('error when creating table ${error.toString()}');
        });

        },
      onOpen: (database)
      {
        print('database opend');

      },

      );
  }

  void insertToDatabase()
  async {
   /* await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks(title, date, startTime, endTime, Reminder, repeate) VALUES("first task","0022","12","1","yes","daily")').then((value){print('$value inserted successfully');}).catchError((error){
        print('error when insertion new record  ${error.toString()}');
      });

    });*/
    await database!.transaction((txn) async {
      int? id1 = await txn.rawInsert(
          'INSERT INTO tasks(title, date, startTime, endTime, Reminder, repeate) VALUES("zzz task","0022","12","1","yes","daily")').then((value){print('$value inserted successfully');}).catchError((error){
        print('error when insertion new record  ${error.toString()}');
      });

    });


  }
}
